class AddColumnTreinings1 < ActiveRecord::Migration
  def change
    add_column :trainings, :exercise_param_f, :hstore, default: {}
    add_column :trainings, :exercise_param_s, :hstore, default: {}
    add_column :trainings, :exercise_param_t, :hstore, default: {}
    add_column :trainings, :exercise_param_fr, :hstore, default: {}
    add_column :trainings, :exercise_param_fv, :hstore, default: {}
    add_column :trainings, :exercise_param_sx, :hstore, default: {}
    add_column :trainings, :exercise_param_sv, :hstore, default: {}
    add_column :trainings, :notice, :string
  end
end
