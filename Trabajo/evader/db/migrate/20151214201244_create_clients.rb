class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50, null: false
      t.string :dni, null: false
      t.date :birthdate, null: false
      t.string :gender, limit: 6, null: false
      t.string :cui, limit: 13, null: false

      t.timestamps null: false
    end
  end
end
