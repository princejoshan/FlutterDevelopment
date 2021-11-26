Feature: AddFeature
  Test add features


  Scenario: Test Plus feature of the app
    Given I test the initial state of the app
    And I click the filterIcon button
    Then I see if the value "Alphabetically" exists