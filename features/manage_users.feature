@users
Feature: admin can create and modify users and roles
  In order to share galacsi work efforts with other people
  An admin
  Should be able to create, update and delete users and roles

@valideur @admin @list
  Scenario Outline: valideur and admin can list users
    Given I am logged in as a <role>
    When I go to the homepage
      And I follow "Utilisateurs"
    Then I should be on the users page
    Scenarios:
      | role      |
      | valideur  |
      | admin     |

@valideur @admin @create
  Scenario Outline: create user
    Given I am logged in as a <role>
    When I go to the users page
      And I follow "Nouvel utilisateur"
      And I fill in the following:
        | nom d'utilisateur         | pinco         |
        | email                     | pinco@ad.com  |
        | mot de passe              | pallino       |
        | confirmer le mot de passe | pallino       |
      And I press "Sauvegarder"
    Then a user should exist with username: "pinco"
    Scenarios:
      | role      |
      | valideur  |
      | admin     |

@admin @edit @valider
  Scenario: edit users profiles
    Given a user exists with username: "test", email: "test@test.com"
      And I am logged in as a admin
    When I go to the user's edit page
      And I fill in the following:
        | nom d'utilisateur         | testino |
        | changer le mot de passe   | test    |
        | confirmer le mot de passe | test    |
      And I press "Sauvegarder"
    Then a user should exist with username: "testino", email: "test@test.com"

  Scenario: list user roles choices
    Given I am logged in as a admin
      And a user exists
    When I go to the user's edit page
    Then I should see "Valideur"
    Then I should see "Contributeur"
    Then I should see "Admin"

@valideur @edit @forbidden
  Scenario: hide admin role choice if not admin
    Given a user exists with username: "test", email: "test@test.com"
      And I am logged in as a valideur
    When I go to the user's edit page
    Then I should not see "Admin"

@admin @edit @valider
  Scenario: change user role
    Given a user exists with role: "contributeur"
      And I am logged in as a admin
    When I go to the user's edit page
      And I select "Valideur" from "Role"
      And I press "Sauvegarder"
    Then a user should exist with role: "valideur"

