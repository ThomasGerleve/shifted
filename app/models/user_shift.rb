class UserShift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shift

  validates :details, presence: true
  validate :user_cannot_have_less_bonuspoints

  def user_cannot_have_less_bonuspoints
    return unless user.present? && user.bonus_points.negative?

    errors.add(:bonus_points, "- it seems you don't have this many to add")
  end
end
