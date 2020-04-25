require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    subject { get :new }

    it { expect(response).to have_http_status(200) }
  end

  # describe 'POST #create' do
  #   subject { post :create }

  #   it { expect(response).to have_http_status(200) }
      # it has flash
  #   it { should redirect_to root_path }
  # end
end

