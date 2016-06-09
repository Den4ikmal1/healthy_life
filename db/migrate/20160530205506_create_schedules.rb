class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.belongs_to :group
      t.boolean :visit 
      t.date :date_employment

      t.timestamps null: false
    end
  end
end
