def add_account(username, category)
  visit '/'
  click_link 'Add an account'
  fill_in 'Username', with: username
  page.select(category, from: 'Category')
  click_button 'Submit'
end
