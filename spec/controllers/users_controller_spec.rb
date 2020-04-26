require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new' do
    before { get :new }

    it { is_expected.to route(:get, '/signup').to(action: :new) }

    it { is_expected.to render_template('new') }
  end

  describe 'POST /create' do
    before do
      @params = {
        user: {
          email: 'alice@wonderland',
          password: 'foobar'
        }
      }
      post :create, params: @params
    end

    it { is_expected.to permit(:email, :password).for(:create, params: @params).on(:user) }

    it { is_expected.to redirect_to root_path }

    it { expect(User.count).to eq 1}
  end
end
