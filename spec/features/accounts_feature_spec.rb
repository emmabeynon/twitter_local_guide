require 'rails_helper'

feature 'Add account' do
  scenario 'allow user to add an account and classification' do
    visit '/'
    click_link 'Add an account'
    fill_in 'Username', with: 'signalse23'
    page.select('Eating out', from: 'Category')
    click_button 'Submit'
    expect(page).to have_content 'Thanks for submitting this account.'
  end
end
