class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, limit: 50, null: false
      t.string :cui, limit: 13, null: false

      t.timestamps null: false
    end
  end
end
