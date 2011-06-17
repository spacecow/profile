Feature:
Background:
Given a project exists
And a user exists with roles_mask: 2
And I am logged in as that user

@javascript
Scenario: Add a new paper
When I go to that project's edit page
And I follow "Add Paper"
And I attach the file "features/grid.pdf" to "File"
And I fill in "Name" with "hopfield" within the paper section
And I fill in "Password" with "foobar"
And I fill in "Password confirmation" with "foobar"
And I press "Update Project"
Then a paper should exist with name: "hopfield", project: that project, file: "grid.pdf"
Then 1 papers should exist
