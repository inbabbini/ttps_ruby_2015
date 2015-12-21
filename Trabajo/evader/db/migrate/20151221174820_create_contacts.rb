class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :client, index: true, foreign_key: true
      t.string :medium, limit: 50
      t.string :value, limit: 100

      t.timestamps null: false
    end
  end
end
