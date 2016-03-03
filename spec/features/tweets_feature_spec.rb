require 'rails_helper'
# As a user
# So that I can find out what's going on locally
# I would like to see only tweets from my local area
feature 'Feature: Local tweets' do
  scenario 'should display a header' do
    visit '/tweets'
    expect(page).to have_content 'SE23 Local Guide'
  end

  scenario 'should display a local account\'s tweets' do
    visit '/tweets'
    expect(page).to have_content 'Archie Parker | @TheArchieParker'
    expect(page).to have_content '01/03/16 @ 13:39'
  end
end
