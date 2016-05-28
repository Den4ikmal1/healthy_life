class RenameColumnToGroups1 < ActiveRecord::Migration
  def change
    remove_column :groups, :days
    add_column :groups, :days, :string
  end
end
