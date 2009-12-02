Feature: admin can create and modify users and roles
  In order to share galacsi work efforts with other people
  An admin
  Should be able to create, update and delete users and roles

  Background:
    Given an admin

  Scenario: list users
    When I go to the homepage
      And I follow "Utilisateurs"
    Then I should be on the users page

  Scenario: create user
    When I go to the users page
      And I follow "Nouvel utilisateur"
      And I fill in the following:
        | nom d'utilisateur         | pinco         |
        | email                     | pinco@ad.com  |
        | mot de passe              | pallino       |
        | confirmer le mot de passe | pallino       |
      And I press "Sauvegarder"
    Then a user should exist with username: "pinco"

  Scenario: edit users profiles
    Given a user exists with username: "test", email: "test@test.com"
    When I go to the user's edit page
      And I fill in the following:
        | nom d'utilisateur         | testino |
        | mot de passe              | test    |
        | confirmer le mot de passe | test    |
      And I press "Sauvegarder"
    Then a user should exist with username: "testino", email: "test@test.com"

