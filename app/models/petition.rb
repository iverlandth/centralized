class Petition < ApplicationRecord
  belongs_to :church
  belongs_to :user

  validates :category, presence: true
  validates :title, presence: true
  validates :message, presence: true
  validates :status, presence: true
  validates :church, presence: true
  validates :user, presence: true

  DATA_PETITIONS = ['ORATION','HELP']

  enum status: [:new, :viewed, :done], _suffix: true

  scope :my_petitions, ->(church_id) { where(church_id: church_id) }


end
