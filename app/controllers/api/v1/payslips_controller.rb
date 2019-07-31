module Api
  module V1
    class PayslipsController < ApplicationController
      def index
        result = Payslips::Retrieve.call(year: params[:year], month: params[:month])

        if result.success?
          render json: result.payslips, each_serializer: PayslipSerializer, status: :ok
        else
          head :not_found
        end
      end

      def update_tax_rate
        result = Payslips::TaxUpdater.call(year: tax_rate_params[:year],
                                           month: tax_rate_params[:month],
                                           tax_rate: tax_rate_params[:tax_rate])

        status = result.success? ? :no_content : :not_found

        head status
      end

      private

      def tax_rate_params
        params.require(:tax_rate)
        params.permit(:year, :month, :tax_rate)
      end
    end
  end
end
