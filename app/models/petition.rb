class Petition < ApplicationRecord
  belongs_to :church
  belongs_to :user
end
