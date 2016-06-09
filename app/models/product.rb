class Product < ActiveRecord::Base
  has_and_belongs_to_many :rations
  has_many :attachments, as: :attachmentable

  accepts_nested_attributes_for :attachments
end
