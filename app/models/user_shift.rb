class UserShift < ApplicationRecord
  belongs_to :user
  belongs_to :shift

  validates :details, presence: true

  include PgSearch::Model
  pg_search_scope :user_shift, associated_against: {
    user: :user,
    shift: :shift
  }
end
