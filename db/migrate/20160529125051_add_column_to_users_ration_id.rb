class AddColumnToUsersRationId < ActiveRecord::Migration
  def change
    add_column :users, :ration_id, :integer
    add_index :users, :ration_id
  end
end
