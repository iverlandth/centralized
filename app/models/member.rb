class Member < ApplicationRecord
  belongs_to :church
  belongs_to :user
  validates :church, presence: true
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true

end
