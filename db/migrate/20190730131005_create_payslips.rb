class CreatePayslips < ActiveRecord::Migration[5.2]
  def change
    create_table :payslips do |t|
      t.string :client_id, null: false
      t.string :vat, null: false
      t.datetime :date, null: false
      t.decimal :gross, null: false, precision: 8, scale: 2
      t.decimal :national_insurance_rate, null: false, precision: 4, scale: 2
      t.decimal :national_insurance_deductions, null: false, precision: 8, scale: 2
      t.decimal :tax_rate, null: false, precision: 4, scale: 2
      t.decimal :taxes, null: false, precision: 8, scale: 2
      t.decimal :net, null: false, precision: 8, scale: 2
      t.references :report, foreign_key: true

      t.timestamps
    end
    add_index :payslips, :client_id, unique: true
  end
end
