class CreatePersonalCharacteristics < ActiveRecord::Migration
  def change
    create_table :personal_characteristics do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :age
      t.float :weight
      t.float :growth
      t.float :activity_index
      t.float :rufe_index
      t.string :rufe_index1

      t.timestamps null: false
    end
  end
end
