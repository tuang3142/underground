require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new' do
    it do
      get :new

      is_expected.to render_template :new
    end
  end
end
