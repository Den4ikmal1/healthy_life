class Training < ActiveRecord::Base
  has_and_belongs_to_many :exercises
  has_many :process_trainings
  has_many :users

  validates :number, :name, :notice, presence: true
end
