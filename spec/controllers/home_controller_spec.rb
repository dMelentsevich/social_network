require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:user) { create(:user, :with_posts) }

  describe 'GET #index' do
    it 'should render index for guests' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end

    it 'should render index for signed in users' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
      
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end
end
