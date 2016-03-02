require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it 'saves the account to the database' do
      account = FactoryGirl.create(:account)
      expect{
        post :create, account: { username: account.username, account: account.category }
      }.to change(Account,:count).by(1)
    end

    it 'redirects to the tweets page' do
      account = FactoryGirl.create(:account)
      post :create, account: { username: account.username, account: account.category }
      expect(response).to redirect_to '/tweets'
    end
  end
end
