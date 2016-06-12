class RemoveForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :personal_characteristics, :users
    remove_foreign_key :personal_characteristics, column: :coach_id
    remove_foreign_key :groups, column: :coach_id
  end
end
