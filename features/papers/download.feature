Feature:
Background:
Given a project exists
And a paper exists with project: that project

Scenario: Download a paper
When I go to that project's paper's download page
