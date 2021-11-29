class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :functional_role
  has_many :user_shifts
  has_many :shifts, through: :user_shifts
  has_many :preferred_slots
  EXPERIENCE_LEVEL = ["beginner", "experienced"]

  validates :first_name, :last_name, :experience_level, :functional_role, presence: true
  validates :experience_level, inclusion: { in: EXPERIENCE_LEVEL }
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
