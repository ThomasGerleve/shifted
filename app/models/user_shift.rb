class UserShift < ApplicationRecord
  belongs_to :user
  belongs_to :shift

  validates :details, presence: true

  include PgSearch::Model
  pg_search_scope :search_shifts_of_user_by_id, against: :user_id
end
