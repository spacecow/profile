Feature:
Background:
Given a project exists
And a page exists with project: that project

@section
Scenario: Edit a page and add a section
When I go to that project's page's edit page
And I fill in "Title" with "Speeches"
And I fill in "Subtitle" with "Foreign country"
And I press "Update Page"
Then a section should exist with title: "Speeches", subtitle: "Foreign country", page: that page
And 1 sections should exist
And 1 pages should exist
And 1 projects should exist

Scenario: If section's title is left blank, no section is created
When I go to that project's page's edit page
And I fill in "Title" with ""
And I press "Update Page"
Then 0 sections should exist
And 1 pages should exist
And 1 projects should exist

