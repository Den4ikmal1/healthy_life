class CreateRations < ActiveRecord::Migration
  def change
    create_table :rations do |t|
      t.string :name
      t.text :description
      
      t.timestamps null: false
    end
  end
end
