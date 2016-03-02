class AccountsController < ApplicationController

  def index
  end

  def create
    account = Account.create(account_params)
    if account.save
      flash[:notice] = "Thanks for submitting this account."
      redirect_to tweets_path
    else
      flash[:notice] = "There was an error. Please try again."
    end
  end

  def account_params
    params.require(:account).permit(:username, :category)
  end

  def new
  end
end
