Feature: contribute fiches
  In order to assess drugs safety during breastfeeding
  As an authorized user
  I want to be able to create fiches

  Background:
    Given I am logged in as a contributeur

  Scenario: new fiche has state "brouillon" by default
    When I go to the fiches page
      And I follow "Nouveau fiche"
      And I fill in "nom" with "lamotrigine"
      And I press "Sauvegarder"
    Then a fiche should exist with state: "brouillon"

  Scenario Outline: show edit link unless "valide" or "gele"
    Given a fiche exists with state: "<state>"
    When I go to the fiche's page
    Then I should <action> "Modifier"
    Examples:
      | state     | action  |
      | brouillon | see     |
      | a_valider | see     |
      | valide    | not see |
      | gele      | not see |

  Scenario: update a fiche
    Given a fiche exists with state: "brouillon"
    When I go to the fiche's edit page
      And I fill in "nom" with "lamotrigina"
      And I press "Sauvegarder"
    Then a fiche should exist with name: "lamotrigina"

  Scenario: push "brouillon" to "à_valider"
    Given a fiche exists with state: "brouillon"
    When I go to the fiche's page
    Then I should see "Initialiser"

  Scenario Outline: contributeurs shouldn't see "valider" or "geler" link
    Given a fiche exists with state: "<state>"
    When I go to the fiche's page
    Then I should not see "<action>"
    Examples:
      | state     | action  |
      | a_valider | Valider |
      | valide    | Geler   |
      | gele      | Valider |
