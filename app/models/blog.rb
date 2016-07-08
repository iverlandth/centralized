class Blog < ApplicationRecord
  belongs_to :event
  belongs_to :church
  belongs_to :user
end
