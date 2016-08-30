Feature: As a User,
I want to see different views of the dashboard,
So I know whether I'm logged in or out

Scenario: Logged in user sees dashboard
  Given I have an existing user account
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

Scenario: Logged In User Clicks 5/5 Link
  Given I have an existing user account
  When I visit "/sign_in"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  And I click "I can take on the world"
  Then I should see "You're feeling great today!"

Scenario: Logged In User Clicks 4/5 Link
  Given I have an existing user account
  When I visit "/sign_in"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  And I click "Positively fine"
  Then I should see "*Positively Fine*"

Scenario: Logged In User Clicks 3/5 Link
  Given I have an existing user account
  When I visit "/sign_in"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  And I click "Not great, but I have things to do"
  Then I should see "Not feeling great, but need something to do?"

Scenario: Logged In User Clicks 2/5 Link
  Given I have an existing user account
  When I visit "/sign_in"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  And I click "I can scrape by"
  Then I should see "Congratulations, you're feeling like you can scrape by!"

Scenario: Logged In User Clicks 1/5 Link
  Given I have an existing user account
  When I visit "/sign_in"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  And I click "Can't get out of bed"
  Then I should see "Feeling like you can't even get out of bed?"

Scenario: Logged In User Clicks Public
  Given I have an existing user account
  When I visit "/sign_in"
  And I fill in "Email" with "kate@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"
  And I click "Public Lists"
  Then I should see "Public Lists"  
