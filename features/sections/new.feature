Feature:
Background:
Given a project exists
And a page exists with project: that project
And a user exists with roles_mask: 2
And I am logged in as that user

@javascript
Scenario: Add a Profile Section
When I go to that project's page's edit page
And I follow "Add Profile Section"
And I fill in "Title" with "Profile Title"
And I fill in "Subtitle" with "Profile Subtitle"
And I attach the file "features/boat.jpg" to "Image"
And I press "Update Page"
And a section should exist with page: that page, title: "Profile Title", subtitle: "Profile Subtitle", image: "boat.jpg"
