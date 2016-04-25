class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :coach_id
  end
end
