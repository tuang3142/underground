require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new' do
    before { get :new }

    it { should route(:get, '/signup').to(action: :new) }

    it { should render_template('new') }
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

    it { should permit(:email, :password).for(:create, params: @params).on(:user) }

    it { should redirect_to root_path}
  end
end
