require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /new" do
    before { get :new }

    it { should route(:get, '/signup').to(action: :new) }

    it { should render_template('new') }
  end
end