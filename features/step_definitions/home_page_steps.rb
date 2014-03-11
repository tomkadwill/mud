### WHEN ###
When /^I visit the site$/ do
  visit '/'
end

### Then ###
Then /^I should be on the home page$/ do
  find('h3').should have_content('Home')
  current_path.should == root_path
end
