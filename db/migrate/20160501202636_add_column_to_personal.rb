class AddColumnToPersonal < ActiveRecord::Migration
  def change
    add_column :personal_characteristics, :coach_id, :integer, foreign_key: true
    add_index :personal_characteristics, :coach_id
  end
end
