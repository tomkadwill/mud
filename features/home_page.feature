Feature: Home page
  As a new user
  When I visit the site
  I should be on the home page

    Background:
      Given I am not logged in

    Scenario: User visits the site
      When I visit the site
      Then I should be on the home page

    Scenario: User should see control panel page title
      When I am on the home page
      Then I should see the home page title
