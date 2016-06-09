class RemoveColumnRationIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :ration_id_id, :integer
    add_column :products, :portion, :string
  end
end
