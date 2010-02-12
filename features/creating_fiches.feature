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

  Scenario Outline: creating fiches with various distinctions
    Given a dci exists with name: "lamotrigine"
    When I go to the dci's page
      And I follow "Nouvelle Fiche"
      And I select "<dist_type>" from "Sous-type fiche"
      And I fill in "fiche[distinction]" with "<distinction>"
      And I press "Sauvegarder"
    Then I should see "Lamotrigine"
      And I should see "<dist_type> : <distinction>"
    Examples:
      | dist_type | distinction   |
      | indication| épilepsie     |
      | voie      | intraveineuse |
      | dosage    | faible        |
