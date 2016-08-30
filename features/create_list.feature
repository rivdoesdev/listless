Feature: As a User,
I want to create new lists,
So that I can add new things to do

Background: A User Logs In
  Given I have an existing user account
  And another user account exists
  When I visit "/sign_in"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  Then I should see "How are you feeling today?"
  And I should see "I can take on the world"

Scenario: Creating a New List Successfully
  When I visit "/lists"
  And I click "New List"
  Then I should see "New List"
  And I fill in "list[title]" with "List"
  And I fill in "Difficulty" with "5"
  And I fill in "Energy" with "5"
  And I fill in "list[due_date]" with "30 August, 2016"
  And I fill in "list_reward" with "Reward"
  And I press "Create List"
  Then I should see "List"

Scenario: Creating a New List Without Params
  When I visit "/lists"
  And I click "New List"
  Then I should see "New List"
  And I fill in "list[title]" with ""
  And I fill in "Difficulty" with ""
  And I fill in "Energy" with ""
  And I fill in "list[due_date]" with ""
  And I fill in "list_reward" with ""
  And I press "Create List"
  Then I should see "Title is too short (minimum is 2 characters)"

Scenario: Creating a New List Without Params
  When I visit "/lists"
  And I click "New List"
  Then I should see "New List"
  And I fill in "list[title]" with "L"
  And I fill in "Difficulty" with ""
  And I fill in "Energy" with ""
  And I fill in "list[due_date]" with ""
  And I fill in "list_reward" with ""
  And I press "Create List"
  Then I should see "Title is too short (minimum is 2 characters)"

Scenario: Creating a New List Without Params
  When I visit "/lists"
  And I click "New List"
  Then I should see "New List"
  And I fill in "list[title]" with "List"
  And I fill in "Difficulty" with "5"
  And I fill in "Energy" with "5"
  And I fill in "list[due_date]" with ""
  And I fill in "list_reward" with ""
  And I press "Create List"
  Then I should see "List"
