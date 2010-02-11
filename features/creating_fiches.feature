Feature: Creating fiches for dci
  In order to have different lactation use case for dcis
  As a galacsi contributor
  I want to create fiches according to different criteria

  Background:
    Given I am logged in as a contributeur

  Scenario: fiche is a nested resource of dci
    Given a dci exists with name: "lamotrigine"
    When I go to the dci's page
      And I follow "Nouvelle Fiche"
    Then I should see "Nouvelle fiche pour lamotrigine"

  Scenario: creating a fiche for an existing dci
    Given a dci exists
    When I go to the dci's page
      And I follow "Nouvelle Fiche"
      And I select "Indication" from "Sous-type fiche"
      And I fill in "fiche[distinction]" with "épilepsie"
      And I press "Sauvegarder"
    Then a fiche should exist
