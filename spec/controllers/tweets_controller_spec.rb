require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  subject(:controller) { described_class.new }
  subject(:twitter_gem) { TweetsController::CLIENT }

  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe '#load_tweets' do
    it 'calls user_tweets' do
      allow(controller).to receive(:user_tweets).and_return('some tweets')
      expect(controller.load_tweets).to eq('some tweets')
    end
  end

  describe '#user_tweets' do
    it 'returns a user' do
      allow(twitter_gem).to receive(:user_timeline).with('thearchieparker').and_return('some tweets')
      expect(controller.user_tweets('thearchieparker')).to eq('some tweets')
    end
  end

end
