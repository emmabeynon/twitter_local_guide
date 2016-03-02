require 'rails_helper'

feature 'Add account' do
  context 'a valid account' do
    scenario 'allow user to add an account and categeory' do
      add_account('signalse23', 'Eating out')
      expect(page).to have_content 'Thanks for submitting this account.'
    end
  end

  context 'an invalid account' do
    scenario 'does not allow user to submit a duplicate account username' do
      add_account('signalse23', 'Drinking')
      add_account('signalse23', 'Drinking')
      expect(page).to have_content 'There was an error. Please try again.'
    end
  end
end
