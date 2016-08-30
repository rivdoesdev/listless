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

Scenario: A User Adds A Task
  Given I have an existing list ranked five
  When I visit "/lists"
  And I click "Start"
  Then I should see "List Five"
  When I click "Add Task"
  Then I should see "New Task"
  And I fill in "task[title]" with "New Task"
  And I fill in "task[description]" with "My Description"
  And I press "Create Task"
  And I should see "List Five"

Scenario: A User Completes A List
  Given I have an existing list ranked five
  When I visit "/lists"
  And I click "Start"
  Then I should see "List Five"
  When I click "Complete"
  Then I should see "Congrats on finishing your list!"


Scenario: A User Updates A List
  Given I have an existing list ranked five
  When I visit "/lists"
  And I click "Start"
  Then I should see "List Five"
  When I click "Update"
  Then I should see "Edit List Five"
  And I fill in "list[title]" with "My Cool List"
  And I press "Update List"
  Then I should see "My Cool List"

Scenario: A User Archives A List
  Given I have an existing list ranked five
  When I visit "/lists"
  And I click "Start"
  Then I should see "List Five"
  When I click "Archive"
  Then I should see "This list has been archived."
  And I click "Back"
  Then I should see "Your Lists:"

Scenario: A User Archives A List and Undoes It
  Given I have an existing list ranked five
  When I visit "/lists"
  And I click "Start"
  Then I should see "List Five"
  When I click "Archive"
  Then I should see "This list has been archived."
  And I click "Undo"
  Then I should see "List Five"
