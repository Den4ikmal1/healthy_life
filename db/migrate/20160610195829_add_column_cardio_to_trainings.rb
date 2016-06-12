class AddColumnCardioToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :exercise_param_cardio, :hstore, default: {}
  end
end
