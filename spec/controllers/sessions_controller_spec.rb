require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    subject { get :new }

    it { expect(response).to have_http_status(200) }
  end

  # todo: add more test
end

