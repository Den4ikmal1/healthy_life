class RemoveColumnToGroups1 < ActiveRecord::Migration
  def change
    remove_column :groups, :users_ids
  end
end
