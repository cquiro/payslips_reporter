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
    end
  end
end
