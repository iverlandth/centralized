class Church < ApplicationRecord
  has_many :blogs
  has_many :events
  has_many :meetings
  has_many :members
  has_many :petitions
end
