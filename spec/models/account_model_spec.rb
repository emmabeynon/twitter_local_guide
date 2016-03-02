require 'rails_helper'

describe Account, type: :model do
  it 'does not accept duplicate account usernames' do
    account1 = Account.create(username: 'thearchieparker')
    account2 = Account.new(username: 'thearchieparker')
    expect(account2).to have(1).error_on(:username)
    expect(account2).not_to be_valid
  end

  it 'does not accept a blank username' do
    account = Account.new(username: nil )
    expect(account).to have(2).errors_on(:username)
    expect(account).not_to be_valid
  end

  it 'only accepts usernames with alphanumeric characters and underscores' do
    account = Account.new(username: '@username')
    expect(account).to have(1).error_on(:username)
    expect(account).not_to be_valid
  end
end
