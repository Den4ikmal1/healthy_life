class CreateProductsRations < ActiveRecord::Migration
  def change
    create_table :products_rations, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :ration, index: true
    end
  end
end
