class AddColumnUsersIdsToScheldules < ActiveRecord::Migration
  def change
    add_column :schedules, :user_ids, :integer, array: true, default: []
  end
end
