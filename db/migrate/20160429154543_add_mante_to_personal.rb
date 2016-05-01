class AddManteToPersonal < ActiveRecord::Migration
  def up
    remove_column :personal_characteristics, :rufe_index, :float
    remove_column :personal_characteristics, :rufe_index1, :string
    add_column :personal_characteristics, :rufe_index, :hstore, default: {}
  end
end
