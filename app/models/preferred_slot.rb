class PreferredSlot < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  validates :weekday, presence: true
  validates :weekday, inclusion: { in: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday] }
end
