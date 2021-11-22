class Shift < ApplicationRecord
  belongs_to :slot
  has_many :user_shifts
end
