Feature:
Background:
Given a project exists

Scenario: Create a new page
When I go to that project's new page page
And I fill in "Name" with "main"
And I press "Create Page"
Then a page should exist with name: "main", project: that project
And I should be on that project's page's page
And I should see "Successfully created page." as notice flash message
And 1 pages should exist

Scenario: A page name cannot be blank
When I go to that project's new page page
And I fill in "Name" with ""
And I press "Create Page"
Then I should see a page name error "can't be blank"

Scenario: A page with the same name in the same project cannot be saved
Given a page exists with project: that project, name: "main"
When I go to that project's new page page
And I fill in "Name" with "main"
And I press "Create Page"
Then I should see a page name error "has already been taken"
