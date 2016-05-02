class AddColumn < ActiveRecord::Migration
  def change
    add_reference :groups, :coach, index: true
    add_reference :personal_characteristics, :coach, index: true
    
  end
end
