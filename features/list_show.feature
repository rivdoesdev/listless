Feature: As a User,
I want to see all the lists I have,
So that I can prioritize what I need to/can do that day

Background: A User Successfully Logs In
  Given I have an existing user account
  When I visit "/sign_in"
  Then I should see "Sign In"
  And I should see "Email"
  And I should see "Password"
  And I should see "Sign Up"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  Then I should see "How are you feeling today?"

Scenario: A User Sees One of their Lists
  Given I have an existing list ranked five
  When I visit "/lists"
  And I click "Start"
  Then I should see "List Five"
  And I should see "Add Task"
  And I should see "Complete"
  And I should see "Give Someone Access to Your List:"
  And I should see "Update"
  And I should see "Archive"
  And I should see "Need help getting started?"
