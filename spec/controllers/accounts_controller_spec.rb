require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  subject(:controller) { described_class.new }

  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'if successful' do
      it 'saves the account to the database' do
        expect{
          post :create, account: { username: 'username', category: 'drinking' }
        }.to change{ Account.count }.by(1)
      end

      it 'redirects to the tweets page' do
        post :create, account: { username: 'username', category: 'Eating out' }
        expect(response).to redirect_to '/tweets'
      end
    end

    context 'if unsuccessful' do
      it 'remains on account creation page' do
        post :create, account: { username: '', category: ''}
        expect(response).to render_template :index
      end
    end
  end

end
