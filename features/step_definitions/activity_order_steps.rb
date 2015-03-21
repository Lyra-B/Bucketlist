Given(/^a traveller who has added several items to their bucketlist$/) do
  @traveller = Traveller.create!(:email => "test@example.org", :password => "password", :password_confirmation => "password")
  # binding.pry
  @traveller.activities << @ride_elephant
  @eat_pasta = Activity.create!(:name => "Eat Pasta", :destination => @italy )
  @traveller.activities << @eat_pasta
  @traveller.activities << @drive_ferrari
end

When(/^I order items by "(.*?)"$/) do |order_option|
  select( "#{order_option}", :from => 'order')
  click_button "Order"
end

Then(/^I should see my items ordered by "(.*?)"$/) do |order_option|
  italy_div = page.all("#destination_#{@italy.id} .activities li")
  # binding.pry
  expect(italy_div.first.has_content?("#{@drive_ferrari.name}")).to be(true)
  expect(italy_div.last.has_content?("#{@eat_pasta.name}")).to be(true)
end
