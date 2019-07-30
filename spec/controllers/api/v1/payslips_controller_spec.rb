require 'rails_helper'

describe Api::V1::PayslipsController do
  describe 'GET #index' do
    context 'when the payslips are not persisted to the db' do
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

    context 'when the payslips are persisted to the db' do
      before do
        get :index, params: { year: 2018, month: 07 }
      end

      it 'returns a 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the report\'s payslips for specified month and year' do
        binding.pry
        expect(response_body.pluck('id')).to eq(report.payslips.pluck(:id))
      end
    end
  end
end
