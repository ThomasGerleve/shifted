class Shift < ApplicationRecord
  belongs_to :slot
  has_many :user_shifts

  validates :date, presence: true

  include PgSearch::Model
  pg_search_scope :search_shifts_of_user_by_id, against: :user_id
  pg_search_scope :search_by_open, against: :open
end
