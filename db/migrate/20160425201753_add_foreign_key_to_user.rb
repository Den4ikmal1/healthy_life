class AddForeignKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :coach_id, :integer, foreign_key: true
  end
end
