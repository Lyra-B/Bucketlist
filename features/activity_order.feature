Feature: Activity Order
  @wip @javascript
  Scenario: A user orders bucket list items by priority, name or date of creation
    Given some destinations with some bucketlist items
      And a traveller who has added several items to their bucketlist
      And I am on the sign in page
    When I sign in
      And I order items by "Name"
    Then I should see my items ordered by "Name"