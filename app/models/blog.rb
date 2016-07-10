class Blog < ApplicationRecord
  belongs_to :event
  belongs_to :church
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :event_id, presence: true
  validates :church_id, presence: true
  validates :user_id, presence: true
end
