Feature:
Background:
Given a project "1" exists
And a page exists with project: that project
And a picture exists with project: that project, name: "normal"
And a user exists with roles_mask: 2
And I am logged in as that user

@blank
Scenario Outline: Picture cannot have its name blank
When I go to that project's edit page
And I fill in "Name" with "<input>" within the picture section
And I press "Update Project"
Then I should see <error> name error "can't be blank" within the first project pictures listing
Examples:
| input | error |
|       | a     |
| Yeah  | no    |

Scenario Outline: The picture name must be unique within the project
Given a project "2" exists
And a picture exists with project: project "<project>", name: "unique"
When I go to project: "1"'s edit page
And I fill in "Name" with "<input>" within the picture section
And I press "Update Project"
Then I should see <error> name error "has already been taken" within the first project pictures listing
Examples:
| input     | error | project |
| unique    | a     |       1 |
| different | no    |       1 |
| unique    | no    |       2 |
| different | no    |       2 |

@image
Scenario: Upload a picture
When I go to that project's edit page
And I attach the file "features/boat.jpg" to "Image"
And I press "Update Project"
Then a picture should exist with image: "boat.jpg"
