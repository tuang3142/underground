require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'Alice', email: 'alice@gmail.com')
    @user1 = User.new(name: '', email: 'alice@gmail.com')
    @user2 = User.new(name: 'Alice', email: '')
  end

  context 'when valid' do
    it { expect(@user).to be_valid }
    context 'must have name and email' do
      it { expect(@user).to validate_presence_of(:name) }
      it { expect(@user).to validate_presence_of(:email) }
    end
  end

  context 'when invalid' do
    it { expect(@user1).to_not be_valid }
    it { expect(@user2).to_not be_valid }
  end

end
