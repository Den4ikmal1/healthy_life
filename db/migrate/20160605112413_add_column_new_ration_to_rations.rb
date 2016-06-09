class AddColumnNewRationToRations < ActiveRecord::Migration
  def change
    add_column :rations, :new_ration, :integer, array: true, default: []
  end
end
