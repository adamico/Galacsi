Feature: validate fiches
  As a valideur
  I want to move up fiches in the validation workflow
  In order to have up to date informations for taking drug during breastfeeding

  Background:
    Given I am logged in as a valideur

  Scenario Outline: valideurs can "initialiser", "valider" and "invalider"
    Given a dci exists
    And the following fiches exist
      | dci     | state     |
      | the dci | brouillon |
      | the dci | a_valider |
      | the dci | valide    |
      | the dci | en_attente|
    When I go to the dci's <position> fiche page
      And I press "<action>"
    Then I should see "Etat de validation : <state>"
    Scenarios:
      | position | action           | state |
      | first    | Initialiser      | A valider|
      | 2nd      | Valider          | Valide    |
      | 3th      | Mettre en attente| En attente|
      | 4th      | Valider          | Valide|

  Scenario: show publication date for published fiches
    Given a dci exists
      And a fiche exists with dci: the dci
    When I validate the fiche
      And I go to the dci's fiche page
    Then I should see today as the publication date

  Scenario: warn if fiches are expired
    Given a dci exists
      And a fiche_expiree exists with dci: the dci
    When I go to the dci's page
    Then I should see "Fiche expirée !"
      And I should see the "Revalider" button

  Scenario: update validation date
    Given a dci exists
    And a fiche_expiree exists with dci: the dci
    When I go to the dci's page
      And I press "Revalider"
    Then I should see today as the publication date

  Scenario: show validation date for valid fiches
    Given a dci exists
      And a fiche exists with dci: the dci
    When I validate the fiche
      And I go to the dci's page
    Then I should see today as the publication date

  Scenario: hide update validation date link when it's been done today
    Given a dci exists
      And a fiche exists with dci: the dci
    When I validate the fiche
      And I go to the dci's fiche page
    Then I should not see "Revalider"

  Scenario: update validation date
    Given a dci exists
    And a fiche_expiree exists with dci: the dci, revalider_le: "2009-01-01"
    When I go to the dci's fiche page
      And I press "Revalider"
    Then I should see today as the publication date
      And I should see "À revalider le :"

  Scenario: show expired validation fiches
    Given a dci exists
      And another dci exists with name: "questa"
      And a distinction exist with name: "indication"
      And a fiche_expiree exists with published_at: "2009-01-01", dci: the 2nd dci, distinction: the distinction, distinction_name: "nuova"
    When I go to the homepage
    Then I should see "Attention vous avez 1 fiche à vérifier"
      And I should see "Questa - Indication : Nuova"
      And I should see "dernière validation le 01/01/2009"

  Scenario: show link to expired validation fiches
    Given a dci exists
      And another dci exists with name: "questa"
      And a distinction exist with name: "indication"
      And a fiche_expiree exists with dci: the 2nd dci, published_at: "2009-01-01", distinction: the distinction, distinction_name: "nuova"
      And I go to the homepage
    When I follow "Questa - Indication : Nuova"
    Then I should see "Questa"
    And I should see "Indication : Nuova"

  Scenario: hide link to expired validation fiches for guests
    Given I am not authenticated
    And a dci exists
    And another dci exists with name: "questa"
    And a distinction exist with name: "indication"
    And a fiche exists with dci: the 2nd dci, revalider_le: "2010-2-11", distinction: the distinction, distinction_name: "nuova"
    When I go to the homepage
    Then I should not see "Attention vous avez : 1 fiche à vérifier"
