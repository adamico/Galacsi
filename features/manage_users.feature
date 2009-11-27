Feature: admin can create and modify users and roles
  In order to share galacsi work efforts with other people
  An admin
  Should be able to create, update and delete users and roles

  Background:
    Given an admin
      And the following roles exist
        | name    |
        | contributeur  |
        | saisisseur    |
        | valideur      |

  Scenario: list users
    When I go to the homepage
    Then I should see "Users"

  @focus
  Scenario: create user
    When I go to the users page
      And I follow "New user"
      And I fill in the following:
        | username              | pinco         |
        | email                 | pinco@ad.com  |
        | password              | pallino       |
        | Password confirmation | pallino       |
      And I press "Submit"
    Then a user should exist with username: "pinco"

