class Ration < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_many :users
end
