require 'rails_helper'

feature 'Local tweets' do
  scenario 'should display a header' do
    visit '/tweets'
    expect(page).to have_content 'SE23 Local Guide'
  end

  scenario 'should display a local account\'s tweets' do
    visit '/tweets'
    expect(page).to have_content 'Archie Parker'
  end
end
