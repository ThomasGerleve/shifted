require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should belong_to(:functional_role) }
    it { should have_many(:user_shifts) }
    it { should have_many(:shifts) }
    it { should have_many(:preferred_slots) }
    it { should have_one_attached(:photo) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:experience_level) }
    it { should validate_presence_of(:functional_role) }
    it { should validate_inclusion_of(:experience_level).
      in_array(['Beginner', 'Experienced']) }
    it { should validate_numericality_of(:bonus_points).
      is_greater_than_or_equal_to(0) }
  end
end
