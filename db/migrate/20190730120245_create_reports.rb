class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :filename, null: false
      t.string :year, null: false
      t.string :month, null: false

      t.timestamps
    end
    add_index :reports, :filename, unique: true
  end
end
