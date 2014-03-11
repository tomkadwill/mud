### Then ###
Then /^I should be on the control panel/ do
  find('h1').should have_content('Control Panel')
  current_path.should == authenticated_root_path
end
