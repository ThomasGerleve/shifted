class UserShift < ApplicationRecord
  belongs_to :user
  belongs_to :shift

  validates :details, presence: true
end
