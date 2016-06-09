class AddColumnToRationsBreakfest < ActiveRecord::Migration
  def change
    add_column :rations, :morning, :integer, array: true, default: []
    add_column :rations, :afternoon, :integer, array: true, default: []
    add_column :rations, :lunch, :integer, array: true, default: []
    add_column :rations, :evening, :integer, array: true, default: []
  end
end
