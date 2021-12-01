class Shift < ApplicationRecord
  belongs_to :slot
  has_many :user_shifts
  has_many :users, through: :user_shifts
  has_many :messages, through: :user_shifts

  validates :date, presence: true

  def user_on_shift?(user)
    users.include?(user)
  end

  def latest_message
    messages.order(created_at: :desc).first
  end

  def unread_messages?(date, user)
    message = latest_message
    message && message.created_at > date && message.user != user
  end
end
