### When ###
When /^I am on the home page$/ do
  visit '/'
end

### Then ###
Then /^I should be on the home page$/ do
  find('h3').should have_content('Home')
  current_path.should == root_path
end

Then /^I should see the home page title$/ do
  expect(page).to have_title 'Homepage'
end
