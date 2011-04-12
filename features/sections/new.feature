Feature:
Background:
Given a project exists
And a user exists with roles_mask: 2
And I am logged in as that user

@javascript
Scenario: Add a Profile Section
When I go to that project's new page page
And I follow "Add Profile Section"
And I fill in "Name" with "page-name"
And I fill in "Title" with "Profile Title"
And I fill in "Subtitle" with "Profile Subtitle"
And I attach the file "features/boat.jpg" to "Image"
And I press "Create Page"
Then a page should exist with project: that project, name: "page-name"
#And a section should exists with page: that page
