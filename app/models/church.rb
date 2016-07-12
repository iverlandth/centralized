class Church < ApplicationRecord
  has_many :blogs
  has_many :events
  has_many :meetings
  has_many :members
  has_many :petitions
  has_many :users

  validates :name, presence: true
  validates :address, presence: true
  validates :country, presence: true
  validates :state, presence: true

  def to_s
    "#{name}"
  end
end
