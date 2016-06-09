class ProcessTraining < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :training
end
