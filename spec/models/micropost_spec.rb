require 'rails_helper'

RSpec.describe Micropost, type: :model do
  it { is_expected.to belong_to :user }
end
