Feature: Registration

  Scenario: A traveller registers with the site
    Given I am on the homepage
      And I go to the sign-up page
    When I complete the form with valid details
      And I submit the form
    Then I should have an account
      And I should receive a welcome e-mail
      And I should see "Welcome aboard" in the flash notice
