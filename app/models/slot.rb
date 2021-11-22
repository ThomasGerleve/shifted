class Slot < ApplicationRecord
  has_many :shifts
  has_many :preferred_slots
end
