Feature: admin can create and modify users and roles
  In order to share galacsi work efforts with other people
  An admin
  Should be able to create, update and delete users and roles

  Background:
    Given an admin

  Scenario: list users
    When I go to the homepage
      And I follow "Users"
    Then I should be on the users page

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

  Scenario: edit users profiles
    Given a user exists with username: "test", email: "test@test.com"
    When I go to the user's edit page
      And I fill in the following:
        | username              | testino |
        | password              | test    |
        | Password confirmation | test    |
      And I press "Submit"
    Then a user should exist with username: "testino", email: "test@test.com"
