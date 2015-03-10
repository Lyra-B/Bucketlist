Feature: Destinations
@wip @javascript
  Scenario: A traveller adds a destination to their bucketlist
    Given some destinations with some bucketlist items
      And a traveller who has added an item to their bucketlist
      And I am on the sign in page
    When I sign in
    When they add a destination
    Then it should appear on the page