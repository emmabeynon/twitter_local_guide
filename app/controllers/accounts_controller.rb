class AccountsController < ApplicationController

  def index
  end

  def create
    accounts.create(account_params)
  end

  def account_params
    params.require(:account).permit(:username, :category)
  end
end
