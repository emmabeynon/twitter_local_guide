class TweetsController < ApplicationController
  before_filter :load_tweets

  def index
  end

  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.access_token = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
  end

  def load_accounts
    accounts = Account.all
  end

  def load_tweets
    user_tweets('thearchieparker')
  end

  def user_tweets(username)
    @tweets = CLIENT.user_timeline(username)
  end
end
