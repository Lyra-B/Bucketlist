Given(/^some destinations with some bucketlist items$/) do
  @india = Destination.create!(:name => "India")
  @ride_elephant = Activity.create!(:name => "Ride an Elephant", :destination => @india)

  @italy = Destination.create!(:name => "Italy")
  @drive_ferrari = Activity.create!(:name => "Drive a Ferrari", :destination => @italy)
end

Given(/^a traveller who has added an item to their bucketlist$/) do
  @traveller = Traveller.create!(:email => "test@example.org", :password => "password", :password_confirmation => "password")
  # binding.pry
  @traveller.activities << @drive_ferrari
end

Given(/^I am on the sign in page$/) do
  visit new_traveller_session_path
end

When(/^I sign in$/) do
  fill_in "Email", :with => @traveller.email
  fill_in "Password", :with => "password"
  click_on "Log in"
end

Then(/^I should see only my own bucketlist$/) do
  # save_and_open_page
  expect(page.has_content?(@italy.name)).to be true
  expect(page.has_content?(@drive_ferrari.name)).to be true

  # expect(page.has_content?(@india.name)).to be false
  # expect(page.has_content?(@ride_elephant.name)).to be false

end