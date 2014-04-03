### WHEN ###
When /^I am on the control panel$/ do
  visit '/'
end

### Then ###
Then /^I should be on the control panel/ do
  find('h1').should have_content('Control Panel')
  current_path.should == authenticated_root_path
end

Then /^I should see control panel page title/ do
  expect(page).to have_title 'Control Panel'
end

Then /^I should see user information/ do
  find('h3').should have_content('example@example.com')
end

Then /^I should see level one info/ do
  find('div.content').should have_content('Welcome to Level 1.')
end
