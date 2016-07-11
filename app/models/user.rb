class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum rol: [:organizer, :leader, :warrior]

  has_many :blogs
  has_many :events
  has_many :meetings
  has_many :petitions
  has_many :members
  belongs_to :church

  scope :my_users, ->(church_id) { where(church_id: church_id) }


  before_save :set_role

  def set_role
    unless rol.present?
      self.rol = User.rols[:organizer]
    end
  end

end
