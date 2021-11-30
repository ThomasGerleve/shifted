class Shift < ApplicationRecord
  belongs_to :slot
  has_many :user_shifts
  has_many :users, through: :user_shifts
  has_many :messages

  validates :date, presence: true
end
