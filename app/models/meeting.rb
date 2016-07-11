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

  DATA_TYPE_MEETING = ['ORATION', 'MEETING YOUNG', 'ADORATION', 'FASTING']
  DATA_DAY = [['Monday', 1], ['Tuesday', 2], ['Wednesday', 3], ['Thursday', 4], ['Friday', 5], ['Saturday', 6], ['Sunday', 7]]

  enum status: [:active, :inactive]
  scope :my_meetings, ->(church_id) { where(church_id: church_id) }

end
