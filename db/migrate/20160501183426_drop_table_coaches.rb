class DropTableCoaches < ActiveRecord::Migration
  def change
    remove_column :groups, :coach_id, :integer
    drop_table :coaches
  end
end
