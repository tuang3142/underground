require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new' do
    it do
      get :new

      is_expected.to render_template :new
    end
  end

  # describe 'POST /create' do
  #   before do
  #     @user = User.create
  #     @params = {
  #       micropost: {
  #         link: '
  #       }
  #   end
  # end

  # describe 'get /index' do
  # end

  # describe 'POST /upvote' do
  # end

  # describe 'POST /downvote' do
  # end
end
