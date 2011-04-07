Feature:
Background:
Given a project exists
And a user exists with roles_mask: 2
And I am logged in as that user

@javascript
Scenario: Add a new paper
When I go to that project's edit page
And I follow "Add Paper"
And I fill in "Name" with "hopfield" within the paper section
