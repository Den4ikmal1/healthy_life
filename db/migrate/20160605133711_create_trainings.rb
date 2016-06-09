class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :number
      t.string :name
      t.string :appointment
      t.timestamps null: false
    end
  end
end
