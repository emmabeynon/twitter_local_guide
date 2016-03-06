require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  subject(:controller) { described_class.new }
  subject(:twitter_gem) { TweetsController::CLIENT }
  let(:tweet) { double :tweet, created_at: '2016-03-03 14:49:40 +0000' }

  before(:each) do
    account1 = FactoryGirl.create(:account)
    account2 = FactoryGirl.create(:account, username: 'signalse23', category: 'Drinking')
    Account.create(username: account1.username, category: account1.category)
    Account.create(username: account2.username, category: account2.category)
  end

  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe '#load_tweets' do
    it 'calls user_tweets' do
      allow(controller).to receive(:user_tweets).with('thearchieparker').and_return([tweet])
      allow(controller).to receive(:user_tweets).with('signalse23').and_return([tweet])
      controller.load_accounts
      expect(controller.tweets).to eq([tweet, tweet])
    end
  end

  describe '#user_tweets' do
    it 'returns a user' do
      allow(twitter_gem).to receive(:user_timeline).with('thearchieparker').and_return(tweet)
      expect(controller.user_tweets('thearchieparker')).to eq(tweet)
    end
  end

  describe '#load_accounts' do
    it 'loads all Twitter accounts from the database' do
      controller.load_accounts
      expect(controller.accounts[0]).to have_attributes username: 'thearchieparker'
      expect(controller.accounts[1]).to have_attributes username: 'signalse23'
    end
  end

  describe 'GET #eating_out' do
    it 'renders the eating_out view' do
      get :eating_out
      expect(response).to render_template :eating_out
    end
  end
end
