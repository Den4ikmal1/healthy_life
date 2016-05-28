class AddColumnToGroups1 < ActiveRecord::Migration
  def change
    add_column :groups, :data_start, :date
    add_column :groups, :data_finish, :date
    add_column :groups, :days, :string, array: true, default: []
  end
end
