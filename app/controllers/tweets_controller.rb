class TweetsController < ApplicationController
  before_filter :load_accounts
  attr_reader :accounts, :tweets

  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.access_token = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
  end

  def index
  end

  def show
    page = params[:id]
    # category = 'Eating out' if page == 'eating_out'
    load_accounts(page)
    render page
  end


  def load_accounts(category='drinking')
    @accounts = Account.where(category: category)
    load_tweets
  end

  def load_tweets
    @tweets = []
    accounts.each do |account|
      @tweets << user_tweets(account.username)
    end
    @tweets.flatten!
    @tweets.sort! { |a,b| b.created_at <=> a.created_at }
  end

  def user_tweets(username)
    CLIENT.user_timeline(username)
  end

end
