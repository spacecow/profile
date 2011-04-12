@pictures @papers
Feature:
Background:
Given a project exists
And a user exists with roles_mask: 2
And I am logged in as that user

@no
Scenario Outline: No pictures/papers attached to the project
Given a <mdl> exists with project: that project, name: "name"
When I go to that project page
Then I should not see "No <mdls>." within the <mdls> section
And I should see "No <other_mdls>." within the <other_mdls> section
Examples:
| mdl     | mdls     | other_mdls |
| picture | pictures | papers     |
| paper   | papers   | pictures   |

@no_image @no_file
Scenario Outline: Picture/paper attached to the project without image/file
Given a <mdl> exists with project: that project, name: "name"
When I go to that project page
But I should see "name ()" within the first listing
Examples:
| mdl     | mdls     |
| picture | pictures |
| paper   | papers   |

@complete
Scenario Outline: Complete picture/paper attached to the project
Given a <mdl> exists with project: that project, name: "name", <listing>
When I go to that project page
But I should see "name (<file>)" within the first listing
Examples:
| mdl     | mdls     | listing                      | file     |
| picture | pictures | image: "boat.jpg"            | boat.jpg |
| paper   | papers   | file: "grid.pdf"             | grid.pdf |

@delete
Scenario Outline: Delete a picture/paper
Given a <mdl> exists with project: that project
When I go to that project page
And I follow "Del" within the first listing
Then 0 <mdls> should exist
Examples:
| mdl     | mdls     |
| paper   | papers   |
| picture | pictures |

