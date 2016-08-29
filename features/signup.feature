Feature: As a New User,
I want to create an account,
So that I can start using the app

Scenario: A User Successfully Creates an Account
  When I visit "/sign_up"
  Then I should see "Sign Up"
  And I should see "Name"
  And I should see "Email"
  And I should see "Password"
  And I fill in "Name" with "Bob"
  And I fill in "Email" with "bob@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  Then I should see "How are you feeling today?"

Scenario: A User Unsuccessfully Creates an Account
  When I visit "/sign_up"
  Then I should see "Sign Up"
  And I should see "Name"
  And I should see "Email"
  And I should see "Password"
  And I press "Submit"
  Then I should see "Email is invalid"
  Then I should see "Email can't be blank"
  Then I should see "Password can't be blank"
  Then I should see "Name can't be blank"
