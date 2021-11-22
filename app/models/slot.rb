class Slot < ApplicationRecord
  has_many :shifts
  has_many :preferred_slots

  validates :name, :start_time, :end_time, presence: true
end
