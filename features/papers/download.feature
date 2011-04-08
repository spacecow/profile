Feature:
Background:
Given a project exists with title: "Hopfield Project"
And a paper exists with project: that project

Scenario: Download a paper
When I go to that project's paper's password page
And I fill in "Password" with "foobar"
And I press "Submit"
