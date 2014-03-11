Feature: Home page
  As a new user
  When I visit the site
  I should be on the home page

    Background:
      Given I am not logged in

    Scenario: User visits the site
      When I visit the site
      Then I should be on the home page
