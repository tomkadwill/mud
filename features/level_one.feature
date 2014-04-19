Feature: Level One
	As a signed in user of the website
	When I visit the site
	I should be on the control panel

	Background:
		Given I am logged in

	Scenario: User should see level one info
		When I am on the control panel
		Then I should see story content

	Scenario: User should see level one step one info
		When I am on the control panel
		Then I should see story content
