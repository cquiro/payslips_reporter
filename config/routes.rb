Rails.application.routes.draw do
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :payslips, only: [:index] do
      collection do
        put :update_tax_rate
      end
    end
  end
end
