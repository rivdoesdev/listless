Feature: As a User,
I want to see different views of the dashboard,
So I know whether I'm logged in or out

Scenario: Logged in user sees dashboard
  Given I have an existing user account
  And another user account exists
  When I visit "/sign_in"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  Then I should see "How are you feeling today?"
  And I should see "Select an option to take you to lists that match your mood."
  And I should not see "When you're logged in, you can select an option that will take you to lists that match your mood."
  And I should see "I can take on the world"
  And I should see "Positively fine"
  And I should see "Not great, but I have things to do"
  And I should see "I can scrape by"
  And I should see "Can't get out of bed"
  And I should see "Public Lists"
  And I should not see "Sign In"

  Scenario: Logged out user sees dashboard
    When I visit "/"
    Then I should see "How are you feeling today?"
    And I should see "When you're logged in, you can select an option that will take you to lists that match your mood."
    And I should not see "Select an option to take you to lists that match your mood."
    And I should see "I can take on the world"
    And I should see "Positively fine"
    And I should see "Not great, but I have things to do"
    And I should see "I can scrape by"
    And I should see "Can't get out of bed"
    And I should see "Public Lists"
    And I should see "Sign In"
