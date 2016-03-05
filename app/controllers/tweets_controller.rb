class TweetsController < ApplicationController
  before_filter :load_accounts
  attr_reader :accounts, :tweets

  def index
  end

  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.access_token = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
  end

  def load_accounts
    @accounts = Account.all
    load_tweets
  end

  def load_tweets
    @tweets = []
    @accounts.each do |account|
      @tweets << user_tweets(account.username)
    end
    @tweets.flatten!
    @tweets.sort! { |a,b| b.created_at <=> a.created_at }
  end

  def user_tweets(username)
    CLIENT.user_timeline(username)
  end
end
