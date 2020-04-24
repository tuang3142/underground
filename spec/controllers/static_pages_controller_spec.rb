require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #home' do
    before { get :home }

    it { should render_template('static_pages/home') }
    it { should render_template(partial: '_header') }
  end
end
