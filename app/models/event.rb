class Event < ApplicationRecord
  belongs_to :church
  belongs_to :user

  has_many :blogs
  has_many :sub_events
end
