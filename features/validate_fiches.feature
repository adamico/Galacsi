Feature: validate fiches
  As a valideur
  I want to move up fiches in the validation workflow
  In order to have up to date informations for taking drug during breastfeeding

  Background:
    Given I am logged in as a valideur
      And a dci exists

  Scenario Outline: valideurs can "initialiser", "valider" and "invalider"
    Given the following fiches exist
      | dci     | state     |
      | the dci | brouillon |
      | the dci | a_valider |
      | the dci | valide    |
      | the dci | en_attente|
    When I go to the dci's <position> fiche page
    Then I should <action>
    Scenarios:
      | position | action               |
      | first    | see "Initialiser"    |
      | 2nd      | see "Valider"        |
      | 3th      | see "Invalider"      |
      | 4th      | see "Valider"        |

  Scenario: validate a fiche
    Given a fiche exists with dci: the dci, state: "a_valider"
    When I go to the dci's fiche page
      And I follow "Valider"
    Then I should be on the dci's page
      And I should see "valide"
      And I should see the validation date

  Scenario Outline: show a link to update validation date for valid fiches
    Given the following fiches exist
      | dci     | state     | validation_date |
      | the dci | brouillon |                 |
      | the dci | a_valider |                 |
      | the dci | valide    | 2008/12/07      |
      | the dci | en_attente|                 |
    When I go to the dci's <position> fiche page
    Then I should <action> "Mettre à jour"
    Scenarios:
      | position | action   |
      | first    | not see  |
      | 2nd      | not see  |
      | 3th      | see      |
      | 4th      | not see  |

  Scenario: show validation date for valid fiches
    Given a fiche exists with dci: the dci, state: "valide"
    When I go to the dci's fiche page
    Then I should see the validation date

  Scenario: hide update validation date link when it's been done today
    Given a fiche exists which has been validated today
    When I go to the dci's fiche page
    Then I should not see "Mettre à jour"

  Scenario: update validation date
    Given a fiche exists with dci: the dci, validation_date: "2008-12-7", state: "valide"
    When I go to the dci's fiche page
      And I follow "Mettre à jour"
    Then I should see "La date de validation a été mise à jour avec succès."
    Then I should see the validation date

  Scenario: show expired validation fiches
    Given a dci exists with name: "questa"
      And a distinction exist with name: "indication"
      And a fiche exists with dci: the 2nd dci, revalider_le: "2010-2-11", distinction: the distinction, distinction_name: "nuova"
    When I go to the homepage
    Then I should see "1 fiche a vérifier"
      And I should see "Questa (indication : nuova)"

  Scenario: show link to expired validation fiches
    Given a dci exists with name: "questa"
      And a distinction exist with name: "indication"
      And a fiche exists with dci: the 2nd dci, revalider_le: "2010-2-11", distinction: the distinction, distinction_name: "nuova"
      And I go to the homepage
    When I follow "Questa (indication : nuova)"
    Then I should be at the dci's fiche page
