require 'rails_helper'
# As a user
# So that I can see tweets from local accounts that I know already
# I would like to add a Twitter account to the app
feature 'Feature: Add account' do
  context 'a valid account' do
    scenario 'allow user to add an account and category' do
      add_account('thearchieparker', 'Drinking')
      expect(page).to have_content 'Thanks for submitting this account.'
    end
  end

  context 'an invalid account' do
    scenario 'does not allow user to submit a duplicate account username' do
      add_account('signalse23', 'Drinking')
      add_account('signalse23', 'Drinking')
      expect(page).to have_content 'There was an error. Please try again.'
    end

    scenario 'does not allow user to submit a blank account username' do
      add_account('', 'Drinking')
      expect(page).to have_content 'There was an error. Please try again.'
    end

    scenario 'does not allow user to submit a username with invalid characters' do
      add_account('@username', 'Drinking')
      expect(page).to have_content 'There was an error. Please try again'
    end

    scenario 'does not allow user to submit a username longer than 15 characters' do
      add_account('alongusername123', 'Drinking')
      expect(page).to have_content 'There was an error. Please try again'
    end
  end
end
