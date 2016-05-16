class AddColumnToGroupsIds < ActiveRecord::Migration
  def change
    add_column :groups, :users_ids, :integer, array: true, default: []
  end
end
