class RemoveColumn < ActiveRecord::Migration
  def change
    remove_index :groups, [:user_id, :coach_id]
    remove_index :personal_characteristics, :coach_id
    remove_column :personal_characteristics, :coach_id, :integer
    remove_column :groups, :coach_id,  :integer
  end
end
