Given(/^I have an existing user account$/) do
  User.create!(name: "Kate", email: "kate@example.com", password: "password", birthday: "01/01/2000", phone_number: "5123006890", about_me: "Hello world!")
end

Given(/^another user account exists$/) do
  User.create!(name: "Matt", email: "matt@example.com", password: "password", birthday: "01/01/2000", phone_number: "5555555555", about_me: "Hello world!")
end

Given(/^I have an existing list ranked five$/) do
  List.create!(title: "List Five", difficulty: 5, energy: 5, due_date: "01/01/2000", reward: "Ruby", user: User.last, public: true)
end

Given(/^I have an existing list ranked four$/) do
  List.create!(title: "List Four", difficulty: 4, energy: 5, due_date: "01/01/2000", reward: "Ruby", user: User.last)
end

Given(/^I have an existing list ranked three$/) do
  List.create!(title: "List Three", difficulty: 3, energy: 5, due_date: "01/01/2000", reward: "Ruby", user: User.last)
end

Given(/^I have an existing list ranked two$/) do
  List.create!(title: "List Two", difficulty: 2, energy: 5, due_date: "01/01/2000", reward: "Ruby", user: User.last)
end

Given(/^I have an existing list ranked one$/) do
  List.create!(title: "List One", difficulty: 1, energy: 5, due_date: "01/01/2000", reward: "Ruby", user: User.last)
end

When(/^I visit "([^"]*)"$/) do |path|
  visit(path)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I click "([^"]*)"$/) do |link|
  click_link(link)
end

When(/^I click the link with id "([^"]*)"$/) do |arg1|
  page.find(arg1).click
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should see "([^"]*)"$/) do |content|
  assert page.has_content?(content)
end

Then(/^I should not see "([^"]*)"$/) do |content|
  refute page.has_content?(content)
end

When(/^I debug$/) do
  puts page.html
  save_and_open_page
  binding.pry
end
