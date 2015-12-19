class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :client, index: true, foreign_key: true, null: false
      t.references :person, index: true, foreign_key: true, null: false
      t.string :description, limit: 255, null: false
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.date :emission_date, null: false

      t.timestamps null: false
    end
  end
end
