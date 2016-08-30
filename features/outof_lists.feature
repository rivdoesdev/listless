Feature: As a User,
I want to see the lists I have ranked by difficulty,
So that I can organize and prioritize what I need to/can do that day

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

Scenario: User Sees Lists Ranked Out of Five
  Given I have an existing list ranked five
  And I have an existing list ranked four
  And I have an existing list ranked three
  And I have an existing list ranked two
  And I have an existing list ranked one
  When I click "I can take on the world"
  Then I should see "You're feeling great today!"
  And I should see "Here are all your lists ranked from most difficult to least. See how much you can get done while you're feeling like you can take on the world."
  And I should see "⭐️⭐️⭐️⭐️⭐️"
  And I should see "List Five"
  And I should see "⭐️⭐️⭐️⭐️"
  And I should see "List Four"
  And I should see "⭐️⭐️⭐️"
  And I should see "List Three"
  And I should see "⭐️⭐️"
  And I should see "List Two"
  And I should see "⭐️"
  And I should see "List One"

Scenario: User Sees Lists Ranked Out of Four
  Given I have an existing list ranked four
  And I have an existing list ranked three
  And I have an existing list ranked two
  And I have an existing list ranked one
  When I click "Positively fine"
  Then I should see "*Positively Fine*"
  And I should see "These lists are on the 4/5 level of difficulty and below. How many tasks can you complete?"
  And I should see "⭐️⭐️⭐️⭐️"
  And I should see "List Four"
  And I should see "⭐️⭐️⭐️"
  And I should see "List Three"
  And I should see "⭐️⭐️"
  And I should see "List Two"
  And I should see "⭐️"
  And I should see "List One"

Scenario: User Sees Lists Ranked Out of Three
  Given I have an existing list ranked three
  And I have an existing list ranked two
  And I have an existing list ranked one
  When I click "Not great, but I have things to do"
  Then I should see "Not feeling great, but need something to do?"
  And I should see "These lists are marked with 3/5 or less on the difficulty scale. Any of these lists should match up with your energy today."
  And I should see "⭐️⭐️⭐️"
  And I should see "List Three"
  And I should see "⭐️⭐️"
  And I should see "List Two"
  And I should see "⭐️"
  And I should see "List One"

Scenario: User Sees Lists Ranked Out of Two
  Given I have an existing list ranked two
  And I have an existing list ranked one
  When I click "I can scrape by"
  Then I should see "Congratulations, you're feeling like you can scrape by!"
  And I should see "These are the lists you marked as having a difficulty level of 2/5 and 1/5. See how far you can get."
  And I should see "⭐️⭐️"
  And I should see "List Two"
  And I should see "⭐️"
  And I should see "List One"

Scenario: User Sees Lists Ranked Out of One
  Given I have an existing list ranked one
  When I click "Can't get out of bed"
  Then I should see "Feeling like you can't even get out of bed?"
  And I should see "These are the lists you marked as the lowest level of difficulty. Try starting with one of these and see how you feel."
  And I should see "⭐️"
  And I should see "List One"
