class SubEvent < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :description, presence: true
  validates :sub_event_start_at, presence: true
  validates :sub_event_end_at, presence: true
  validates :place, presence: true
  validates :event, presence: true

end
