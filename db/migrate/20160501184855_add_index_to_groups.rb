class AddIndexToGroups < ActiveRecord::Migration
  def change
    remove_index :groups, :coach_id
    add_index :groups, [:user_id, :coach_id]
  end
end
