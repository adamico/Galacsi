Feature: managing dcis
  In order to have GalacSI
  As a user
  I want to create, modify and delete dcis

  Background:
    Given I am logged in as a contributeur

  Scenario: creating valid dcis
    When I go to the new dci page
      And I fill in "Nom" with "aNom"
      And I press "Enregistrer"
    Then 1 dcis should exist

  Scenario: can't create dci if name taken
    Given a dci exists with name: "aNom"
    When I go to the new dci page
      And I fill in "Nom" with "aNom"
      And I press "Enregistrer"
    Then I should see "Name n'est pas disponible"

  Scenario: adding commercial names for dcis
    Given a dci exists
    When I go to the dci's edit page
      And I fill in "Spécialités" with "nomcommercial"
      And I press "Enregistrer"
    Then 1 specialites should exist
      And I should see "(nomcommercial)"
