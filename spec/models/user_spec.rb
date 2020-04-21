require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    user = User.new(name: 'Alice', email: 'alice@gmail.com')
  end

  it 'must have name and email' do
    it { expect(user).to validate_presence_of(:name) }
    it { expect(user).to validate_presence_of(:email) }
  end
end
