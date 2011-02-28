Feature:
Background:
Given a project "1" exists
And a page exists with project: that project
And a picture exists with project: that project, name: "normal"

Scenario Outline: Picture cannot have its name blank
When I go to that project's edit page
And I fill in "Name" with "<input>"
And I press "Update Project"
Then I should see <error> picture name error "can't be blank"
Examples:
| input | error |
|       | a     |
| Yeah  | no    |

Scenario Outline: The picture name must be unique within the project
Given a project "2" exists
And a page exists with project: that project
And a picture exists with project: project "<project>", name: "unique"
When I go to project: "1"'s edit page
And I fill in "Name" with "<input>"
And I press "Update Project"
Then I should see <error> picture name error "has already been taken"
Examples:
| input     | error | project |
| unique    | a     |       1 |
| different | no    |       1 |
| unique    | no    |       2 |
| different | no    |       2 |

@image
Scenario: Upload a picture
When I go to that project's edit page
And I attach the file "public/images/rails.png" to "Image"
And I press "Update Project"
Then a picture should exist with image: "rails.png"