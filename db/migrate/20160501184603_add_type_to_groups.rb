class AddTypeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :coach_id, :integer
    add_index :groups, :coach_id
  end
end
