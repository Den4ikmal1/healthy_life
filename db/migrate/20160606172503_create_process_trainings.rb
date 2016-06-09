class CreateProcessTrainings < ActiveRecord::Migration
  def change
    create_table :process_trainings do |t|
      t.belongs_to :ration
      t.belongs_to :exercise
      t.integer :count
      t.float :weight
      t.timestamps null: false
    end
  end
end
