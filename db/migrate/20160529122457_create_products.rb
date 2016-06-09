class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :emulcifying_value
      t.float :protein
      t.float :carbohydrates
      t.float :fats
      t.belongs_to :ration_id

      t.timestamps null: false
    end
  end
end
