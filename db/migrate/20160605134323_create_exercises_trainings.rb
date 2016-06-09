class CreateExercisesTrainings < ActiveRecord::Migration
  def change
    create_table :exercises_trainings, id: false do |t|
      t.belongs_to :exercise
      t.belongs_to :training
    end
  end
end
