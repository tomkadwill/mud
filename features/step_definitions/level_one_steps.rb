Then /^I should see story content/ do
	find('div.content').should have_content('You are lost in the jungle')
end
