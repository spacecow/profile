Feature:
Background:
Given a project exists
And a page exists with project: that project

Scenario: Create a new page
When I go to that project's page's new section page
And I fill in "Title" with "Speeches"
And I fill in "Subtitle" with "Foreign country"
And I press "Create Section"
Then I should be on that project's page's sections page
And I should see "Successfully created section." as notice flash message
And a section should exist with title: "Speeches", subtitle: "Foreign country", page: that page
And 1 sections should exist
