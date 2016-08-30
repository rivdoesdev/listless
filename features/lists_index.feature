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

Scenario: A User Sees All Their Lists
  Given I have an existing list ranked five
  And I have an existing list ranked four
  And I have an existing list ranked three
  And I have an existing list ranked two
  And I have an existing list ranked one
  When I visit "/lists"
  Then I should see "Your Lists:"
  And I should see "Lists You Have Access To:"
  And I should see "List Five"
  And I should see "List Four"
  And I should see "List Three"
  And I should see "List Two"
  And I should see "List One"
  And I should see "Archived Lists"
  And I should see "Permissions"
