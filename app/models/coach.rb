class Coach < User
  has_many :groups
  has_many :personal_characteristics
end
