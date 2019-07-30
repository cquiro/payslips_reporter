module Api
  module V1
    class PayslipsController < ApplicationController
      def index
        payslips = Report.find_by(filename: "payslips.#{params[:year]}#{params[:month]}.txt")
                         .payslips
        render json: payslips, each_serializer: PayslipSerializer, status: :ok
      end
    end
  end
end
