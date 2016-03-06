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
    add_account('thearchieparker', 'Eating out')
    visit '/tweets'
    expect(page).to have_content 'Archie Parker | @TheArchieParker'
  end
end

# As a user
# So that I can choose somewhere to go out to eat
# I would like to see tweets from restaurants and cafes only
feature 'Feature: Categorisation' do
  scenario 'should display tweets from the \'Eating Out\' category only' do
    add_account('canvasandcream', 'Eating out')
    visit '/tweets'
    click_link 'Eating out'
    expect(page).to have_content 'Eating out'
    expect(page).to have_content 'Canvas&Cream | @CanvasandCream'
  end
end
