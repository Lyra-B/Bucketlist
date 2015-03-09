Given(/^I am on the homepage$/) do
  visit root_path
end

Given(/^I go to the sign\-up page$/) do
  click_link "Sign up"
end

When(/^I complete the form with valid details$/) do
  fill_in 'Email', with: "glykeriapeppa@gmail.com"
  fill_in 'Password', with: "password"
  fill_in 'Password confirmation', with: "password"
end

When(/^I submit the form$/) do
  click_button 'Sign up'
end

Then(/^I should have an account$/) do
  expect(Traveller.count).to eq(1)
end

Then(/^I should receive a welcome e\-mail$/) do
  expect(ActionMailer::Base.deliveries.length).to be(1)
  expect(ActionMailer::Base.deliveries.first.subject).to match(/Welcome/)
end

Then(/^I should see "(.*?)" in the flash notice$/) do |message|
  within('#flash .notice') do
    expect(page).to have_content(message)
  end
end