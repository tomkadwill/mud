Feature: Control Panel
  As a signed in user of the website
  When I visit the site
  I should be on the control panel

  Background:
    Given I am logged in

  Scenario: User visits the site
    When I visit the site
    Then I should be on the control panel
