class UserShift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shift
  has_many :messages

  validates :details, presence: true
end
