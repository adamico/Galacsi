Feature: manage users and roles
  In order to share galacsi work efforts with other people
  A user in the valideur role
  Should be able to create, update and delete users and roles

  Background:
    Given I am logged in as a valideur

  Scenario: create user
    When I go to the new user page
      And I fill in the following:
        | Nom d'utilisateur         | pinco         |
        | Email                     | pinco@ad.com  |
        | Mot de passe              | pallino       |
        | Confirmer le mot de passe | pallino       |
      And I press "Sauvegarder"
    Then a user should exist with username: "pinco"
    
  Scenario: edit users profiles
    Given a user exists
    When I go to the 2nd user's edit page
      And I fill in the following:
        | Nom d'utilisateur         | testino |
        | Changer le mot de passe   | testin  |
        | Confirmer le mot de passe | testin  |
      And I press "Sauvegarder"
    Then a user should exist with username: "testino"

  Scenario: change user role
    Given a user exists with username: "test", email: "test@test.com"
    When I go to the user's edit page
      And I fill in the following:
        | Changer le mot de passe   | testin  |
        | Confirmer le mot de passe | testin  |
      And I select "valideur" from "Role"
      And I press "Sauvegarder"
    Then a valideur should exist with username: "test"
