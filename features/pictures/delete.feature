Feature:
Background:
Given a project exists
And a page exists with project: that project
And a picture exists with project: that project

Scenario: Picture cannot have its name blank
When I go to that project's edit page
And I check "Remove"
And I press "Update Project"
Then 0 pictures should exist
