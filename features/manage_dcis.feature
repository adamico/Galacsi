Feature: managing dcis
  In order to have GalacSI
  As a user
  I want to create, modify and delete dcis

  Scenario: creating valid dcis
    Given I am logged in as a contributeur
    When I go to the new dci page
      And I fill in "Nom" with "aNom"
      And I press "Enregistrer"
    Then 1 dcis should exist

  Scenario: adding commercial names for dcis
    Given a dci exists
      And I am logged in as a contributeur
    When I go to the dci's edit page
      And I fill in "Spécialités" with "nomcommercial"
      And I press "Enregistrer"
    Then 1 specialites should exist
      And I should see "(nomcommercial)"
