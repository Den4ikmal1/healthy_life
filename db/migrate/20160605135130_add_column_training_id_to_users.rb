class AddColumnTrainingIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :training_id, :integer
    add_index :users, :training_id
  end
end
