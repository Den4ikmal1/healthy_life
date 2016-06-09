class Exercise < ActiveRecord::Base

  has_and_belongs_to_many :trainings
  has_many :attachments, as: :attachmentable
  has_many :process_trainings
  accepts_nested_attributes_for :attachments
end
