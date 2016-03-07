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

# As a user
# So that I can choose somewhere to go for a drink
# I would like to see tweets from pubs and bars only
  scenario 'should display tweets from the \'Drinking\' category only' do
    add_account('signalse23', 'Drinking')
    visit '/tweets'
    click_link 'Drinking'
    expect(page).to have_content 'Drinking'
    expect(page).to have_content 'The Signal | @SignalSE23'
  end

# As a user
# So that I can choose somewhere to go to enjoy some culture
# I would like to see tweets from museums, galleries and theatres only
  scenario 'should display tweets from the \'Culture\' category only' do
    add_account('HornimanMuseum', 'Culture')
    visit '/tweets'
    click_link 'Culture'
    expect(page).to have_content 'Culture'
    expect(page).to have_content 'Horniman Museum | @HornimanMuseum'
  end
end
