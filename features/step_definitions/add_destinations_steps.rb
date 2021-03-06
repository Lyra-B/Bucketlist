Given (/^they have signed in$/) do
  step "I am on the sign in page"
  step "I sign in"
end

When(/^they add a destination$/) do
  within('#add-destination') do
    fill_in "Name", :with => "India"
    fill_in "Image URL", :with => "http://example.org/image.jpg"
    click_button "Add Destination"
  end
end

When(/^they add an activity$/) do
  within("#destination_#{@italy.id}") do
    fill_in "Name", :with => "Eat Pasta"
    fill_in "Image URL", :with => "http://example.org/image.jpg"
    # select '5', from: "activity_bucket_list_items_attributes_0_priority_id"
    # binding.pry
    click_button "Add Activity"
  end
end

When(/^they add a second activity$/) do
    within("#destination_#{@italy.id}") do
    fill_in "Name", :with => "See Coloseum"
    fill_in "Image URL", :with => "http://example.org/image.jpg"
    # select '3', from: "activity_bucket_list_items_attributes_0_priority_id"
    click_button "Add Activity"
  end
end

Then(/^they see their activity under the relevant destination$/) do  # ActivityPriority.create(bucket_list_items_id: 1)
  binding.pry
  expect(page.has_content?('Eat Pasta')).to be true
  expect(page.has_css?("img[src='http://example.org/image.jpg']")).to be true
end

Then(/^it should appear on the page$/) do
  # binding.pry
  expect(page.has_content?("India")).to be true
  expect(page.has_css?("img[src='http://example.org/image.jpg']")).to be true
end

Then(/^the activity is stored in the traveller's bucketlist$/) do  # save_and_open_page
  # binding.pry
  expect(@traveller.reload.activities.length > 1).to be true
end
