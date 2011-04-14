Feature:
Background:
Given a project exists
And a user exists with roles_mask: 2
And I am logged in as that user

Scenario: Create a new page
When I go to that project's new page page
And I fill in "Name" with "main"
And I press "Create Page"
Then a page should exist with name: "main", project: that project
And I should be on that project's page's page
And I should see "Successfully created page." as notice flash message
And 1 pages should exist

Scenario: If the page is the first in its project, its pos should be set to 0
When I go to that project's new page page
And I fill in "Name" with "main"
And I press "Create Page"
Then a page should exist with project: that project, pos: 0

Scenario Outline: A second page should get its pos set to the previous' +1
Given a page exists with project: that project, pos: <no>
When I go to that project's new page page
And I fill in "Name" with "main"
And I press "Create Page"
Then a page should exist with project: that project, pos: <no>
And a page should exist with project: that project, pos: <no2>
And 2 pages should exist
Examples:
| no | no2 |
|  0 |   1 |
|  2 |   3 |

Scenario: A third page should get its pos set to the previous' +1
Given a page exists with project: that project, pos: 1
And a page exists with project: that project, pos: 4
When I go to that project's new page page
And I fill in "Name" with "main"
And I press "Create Page"
Then a page should exist with project: that project, pos: 1
And a page should exist with project: that project, pos: 4
And a page should exist with project: that project, pos: 5
And 3 pages should exist

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
