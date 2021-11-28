class UserShift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shift

  validates :details, presence: true
end
