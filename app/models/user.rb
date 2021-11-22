class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :functional_role
  has_many :user_shifts
  has_many :preferred_slots

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
