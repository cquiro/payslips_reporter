require 'rails_helper'

describe Api::V1::PayslipsController do
  describe 'GET #index' do
    context 'when the year/month payslip report exists' do
      let(:report) { create(:report, year: '2018', month: '07') }
      let!(:payslips) do
        create_list(:payslip, 2, date: DateTime.parse('20180711'), report: report)
      end

      before do
        get :index, params: { year: report.year, month: report.month }
      end

      it 'returns a 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the report\'s payslips for specified month and year' do
        expect(response_body.pluck('id')).to eq(report.payslips.pluck(:client_id))
      end
    end

    context 'when the year/month payslip report does not exist' do
      before do
        allow(Payslips::Retrieve).to receive(:call) do
          double("Interactor::Context", success?: false)
        end

        get :index, params: { year: '2018', month: '07' }
      end

      it 'returns a 404 status code' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns and empty body' do
        expect(response_body).to be_nil
      end
    end
  end

  describe 'PUT #update_tax_rate' do
    context 'when the year/month payslip report exists' do
      let(:report) { create(:report, year: '2018', month: '07') }
      let!(:payslips) do
        create_list(
          :payslip, 2,
          date: DateTime.parse('20180711'),
          report: report,
          gross: '3000.00',
          national_insurance_rate: '07.00',
          national_insurance_deductions: '210.00',
          tax_rate: '12.00',
          taxes: '360.00',
          net: '2430.00'
        )
      end

      before do
        put :update_tax_rate, params: { year: '2018', month: '07', tax_rate: 25.00 }
      end

      it 'returns a 204 status code' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the tax rate for the year/month payslips' do
        expect(report.payslips.pluck(:tax_rate)).to eq [25.00, 25.00]
      end

      it 'updates the values affected by the tax rate change' do
        expect(report.payslips.last.net).to eq 2040.00 # net calculated manually for 25% tax rate
      end
    end

    context 'when the year/month payslip report does not exist' do
      before do
        put :update_tax_rate, params: { year: '2018', month: '07', tax_rate: 25.00 }
      end

      it 'returns a 404 status code' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns and empty body' do
        expect(response_body).to be_nil
      end
    end
  end
end
