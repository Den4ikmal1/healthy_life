class AddIndexForIndexRufeToPesonal < ActiveRecord::Migration
  def change
    add_index :personal_characteristics, :rufe_index,  using: :gist
  end
end
