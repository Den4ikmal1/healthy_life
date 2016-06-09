class AddColumnToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :rule, :text
  end
end
