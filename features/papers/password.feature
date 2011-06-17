Feature:
Background:
Given a project exists with title: "Hopfield Project"
And a paper exists with project: that project

Scenario: Download a paper
When I go to that project's paper's password page with "title=hopfield"
Then I should see "Hopfield Project" as title
And I should see "hopfield is password protected."

# Scenario: Return to page if password is incorrect
# When I go to that project's paper's password page with "title=hopfield"
# And I press "Submit"
# Then show me the page
# And I should see "hopfield is password protected."
# And I should see "The password you provided is wrong." as alert flash message
