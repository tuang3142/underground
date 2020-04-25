require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  subject { get :new }

  it { expect(response).to have_http_status(200) }
end
