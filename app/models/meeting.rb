class Meeting < ApplicationRecord
  belongs_to :church
  belongs_to :user
  validates :name, presence: true
  validates :type_meeting, presence: true
  validates :day, presence: true
  validates :meeting_start_at, presence: true
  validates :meeting_end_at, presence: true
  validates :address, presence: true
  validates :status, presence: true
  validates :church, presence: true
  validates :user, presence: true
end
