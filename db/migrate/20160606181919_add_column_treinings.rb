class AddColumnTreinings < ActiveRecord::Migration
  def change
    add_column :trainings, :exercise_param, :hstore, default: {}
  end
end
