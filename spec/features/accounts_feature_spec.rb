require 'rails_helper'

feature 'Add account' do
  context 'a valid account' do
    scenario 'allow user to add an account and categeory' do
      visit '/'
      click_link 'Add an account'
      fill_in 'Username', with: 'signalse23'
      page.select('Eating out', from: 'Category')
      click_button 'Submit'
      expect(page).to have_content 'Thanks for submitting this account.'
    end
  end

  context 'an invalid account' do
    scenario 'does not allow user to submit a duplicate account username' do
      visit '/accounts'
      fill_in 'Username', with: 'emmabeynon'
      page.select('Drinking', from: 'Category')
      click_button 'Submit'
      click_link 'Add an account'
      fill_in 'Username', with: 'emmabeynon'
      page.select('Drinking', from: 'Category')
      click_button 'Submit'
      expect(page).to have_content 'There was an error. Please try again.'
    end
  end
end
