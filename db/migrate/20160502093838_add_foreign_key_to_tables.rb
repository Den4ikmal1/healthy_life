class AddForeignKeyToTables < ActiveRecord::Migration
  def change
    add_foreign_key :groups, :users, column: :coach_id
    add_foreign_key :personal_characteristics, :users, column: :coach_id
    add_foreign_key :users, :users, column: :coach_id
  end
end
