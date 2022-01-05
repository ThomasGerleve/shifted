require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates correctly' do
    user = create(:user)

    expect(user).to eq ''
  end
end
