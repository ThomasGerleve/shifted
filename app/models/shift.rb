class Shift < ApplicationRecord
  belongs_to :slot
  has_many :user_shifts
  has_many :users, through: :user_shifts

  validates :date, presence: true
end
