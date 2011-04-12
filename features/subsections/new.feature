Feature:
Background:
Given a project exists
And a page exists with project: that project
And a section exists with page: that page, type: "ProfileSection"
And a user exists with roles_mask: 2
And I am logged in as that user

@javascript
Scenario: Add a Table Subsection to a Profile Section
When I go to that project's page's edit page
And I follow "Add Table Row"
