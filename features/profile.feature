Feature: As a User,
I want to see my information on my profile page,
So that I have all of my information in one place

Background: A User Logs In
  Given I have an existing user account
  And another user account exists
  When I visit "/sign_in"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  Then I should see "How are you feeling today?"
  When I click "I can take on the world"

Scenario: User sees their own profile page
  When I click the link with id "#user_icon"
  Then I should see "Welcome, Kate!"
  And I should see "Sign Out"
  And I should see "Edit Profile"
  And I should see "e: kate@example.com"
  And I should see "b: 01/01/2000"
  And I should see "p: 5123006890"
  And I should see "Hello world!"

Scenario: User sees another user's profile page
  When I visit "/search?utf8=%E2%9C%93&query=m"
  And I click "Matt"
  Then I should see "Matt"
  And I should not see "Sign Out"
  And I should not see "Edit Profile"
  And I should see "e: matt@example.com"
  And I should see "b: 01/01/2000"
  And I should see "p: 5555555555"
  And I should see "Hello world!"
