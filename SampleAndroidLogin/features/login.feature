@android
Feature: Basic

  Scenario: T1: Verify text entered by user is displayed on Details Activity page
    Given I have launched the app
    When I enter text "Username" on Test page
    When I enter text "Password" on Test page
    And I click "Submit" button
    Then I am navigated to "Login" page
    And I verify text entered by user above is displayed successfully
