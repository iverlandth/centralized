class Event < ApplicationRecord
  belongs_to :church
  belongs_to :user

  has_many :blogs
  has_many :sub_events

  validates :name, prensence: true
  validates :description, prensence: true
  validates :event_start_at, prensence: true
  validates :event_end_at, prensence: true
  validates :address, prensence: true
  validates :status, prensence: true
  validates :church_id, prensence: true
  validates :user, prensence: true

end
