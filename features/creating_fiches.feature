Feature: Creating fiches for dci
  In order to have different lactation use case for dcis
  As a galacsi contributor
  I want to create fiches according to different criteria

  Background:
    Given I am logged in as a contributeur
      And a dci exists

  Scenario: fiche is a nested resource of dci
    When I go to the dci's page
      And I follow "Nouvelle Fiche"
    Then I should be at the new dci's fiche page

  Scenario Outline: creating fiches with various distinctions
    When I go to the dci's new fiche page
      And I select "<dist_type>" from "Sous-type fiche"
      And I fill in "fiche[distinction]" with "<distinction>"
      And I press "Sauvegarder"
    Then I should be at the dci page
      And I should see "<dist_type> : <distinction>"
    Examples:
      | dist_type | distinction   |
      | indication| épilepsie     |
      | voie      | intraveineuse |
      | dosage    | faible        |

  Scenario: adding alternatives to fiches
    When I go to the dci's new fiche page
      And I fill in "Alternatives" with "desloratadine, cétirizine, ampicilline"
      And I press "Sauvegarder"
    Then I should see "Alternatives : desloratadine, cétirizine, ampicilline"

  Scenario: creating detailed fiches
    When I go to the dci's new fiche page
      And I select "indication" from "Sous-type fiche"
      And I fill in "fiche[distinction]" with "épilepsie"
      And I fill in "fiche[ei]" with "1 cas d'acidose métabolique"
      And I fill in "Conditions" with "si pas d'alternative utilisable"
      And I fill in "fiche[surveillance]" with "l'apparition de troubles digestifs"
      And I fill in "Alternatives" with "desloratadine, cétirizine, ampicilline"
      And I press "Sauvegarder"
    Then 1 fiches should exist
