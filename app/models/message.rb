class Message < ApplicationRecord
  belongs_to :user_shift
  belongs_to :user
end
