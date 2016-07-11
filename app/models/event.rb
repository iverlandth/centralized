class Event < ApplicationRecord
  belongs_to :church
  belongs_to :user

  has_many :blogs
  has_many :sub_events

  validates :name, presence: true
  validates :description, presence: true
  validates :event_start_at, presence: true
  validates :event_end_at, presence: true
  validates :address, presence: true
  validates :status, presence: true
  validates :church_id, presence: true
  validates :user, presence: true

  enum status: [:active, :inactive]

  scope :my_events, ->(church_id) { where(church_id: church_id) }

end
