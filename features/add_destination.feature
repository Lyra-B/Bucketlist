Feature: Destinations
# @wip @javascript
  Scenario: A traveller adds a destination to their bucketlist
    Given some destinations with some bucketlist items
      And a traveller who has added an item to their bucketlist
      And I am on the sign in page
    When I sign in
    When they add a destination
    Then it should appear on the page

 @wip @javascript
  Scenario: A traveller adds an activity to a destination on their bucketlist
    Given some destinations with some bucketlist items
      And a traveller who has added an item to their bucketlist
      And I am on the sign in page
      And I sign in
    When they add an activity
    Then they see their activity under the relevant destination