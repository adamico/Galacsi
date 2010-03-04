Feature: admin can create and modify users and roles
  In order to share galacsi work efforts with other people
  An admin
  Should be able to create, update and delete users and roles

  Scenario Outline: valideur and admin can list users
    Given I am logged in as a <role>
    When I go to the users page
    Then I should be on the users page
    Scenarios:
      | role      |
      | valideur  |
      | admin     |

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

  Scenario: edit users profiles
    Given I am logged in as a admin
      And another user exists
    When I go to the 2nd user's edit page
      And I fill in the following:
        | nom d'utilisateur         | testino |
        | changer le mot de passe   | test    |
        | confirmer le mot de passe | test    |
      And I press "Sauvegarder"
    Then a user should exist with username: "testino"

  Scenario: list user roles choices for admin
    Given a user exists with username: "test", email: "test@test.com"
      And I am logged in as a admin
    When I go to the user's edit page
    Then I should see "valideur"
    Then I should see "contributeur"
    Then I should see "admin"

  Scenario: hide admin role choice if not admin
    Given a user exists with username: "test", email: "test@test.com"
      And I am logged in as a valideur
    When I go to the user's edit page
    Then I should not see "admin"

  Scenario: change user role
    Given a user exists with username: "test", email: "test@test.com"
      And I am logged in as a admin
    When I go to the user's edit page
      And I select "valideur" from "Role"
      And I press "Sauvegarder"
    Then a user should exist with role: "valideur"
