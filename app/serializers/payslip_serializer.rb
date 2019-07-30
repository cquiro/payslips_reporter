class PayslipSerializer < ActiveModel::Serializer
  attributes :id, :date, :gross, :national_insurance_deductions,
             :national_insurance_rate, :net, :taxes, :tax_rate, :vat

  def id
    object.client_id
  end

  def date
    object.date.strftime('%Y%m%d')
  end
end

