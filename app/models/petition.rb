class Petition < ApplicationRecord
  belongs_to :church
  belongs_to :user

  validates :category, presence: true
  validates :title, presence: true
  validates :message, presence: true
  validates :status, presence: true
  validates :church, presence: true
  validates :user, presence: true

end
