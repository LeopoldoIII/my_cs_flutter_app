Feature: Home Navigation
  As a user
  I want to navigate to the button feature screen from the home screen
  So that I can interact with the buttons

  Scenario: Navigate to button screen
    Given the app is running
    When I tap {'Button Feature'} text
    Then I see {'Button'} text
