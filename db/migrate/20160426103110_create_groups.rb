class CreateGroups < ActiveRecord::Migration
  def up
    create_table :groups do |t|
      t.references :user, foreign_key: true
      t.references :coach, foreign_key: true
      t.timestamps null: false
    end
    add_index :groups, [:user_id, :coach_id]
  end
end
