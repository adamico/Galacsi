Feature: Creating fiches for dci
  In order to have different lactation use case for dcis
  As a galacsi contributor
  I want to create fiches according to different criteria

  Background:
    Given I am logged in as a contributeur
      And a dci exists

  Scenario: fiche is a nested resource of dci
    When I go to the dci's page
      And I follow "Rajouter une fiche"
    Then I should be at the new dci's fiche page

  Scenario Outline: creating fiches with various distinctions
    Given the following distinctions exist:
      | name      |
      | indication|
      | voie      |
      | dosage    |
    When I go to the dci's new fiche page
      And I select "<dist_type>" from "Sous-type fiche"
      And I fill in "fiche[distinction_name]" with "<distinction>"
      And I press "Sauvegarder"
    Then I should be at the dci page
      And I should see "<dist_type> : <distinction>"
    Examples:
      | dist_type   | distinction   |
      | indication  | épilepsie     |
      | voie        | intraveineuse |
      | dosage      | faible        |

  Scenario: adding alternatives to fiches
    When I go to the dci's new fiche page
      And I fill in "Alternatives" with "desloratadine, cétirizine, ampicilline"
      And I press "Sauvegarder"
    Then I should see "Alternatives :"
      And I should see "desloratadine"
      And I should see "cétirizine"
      And I should see "ampicilline"

  @wip
  Scenario: adding argumentaire details for fiches
    When I go to the dci's new fiche page
      And I fill in "Biodisponibilité" with "100"
      And I fill in "Dose ingérée par BB" with "4"
      And I select "DMAP" from "de la"
      And I fill in "Liaison aux protéines plasmatiques" with "90"
      And I fill in "Volume de distribution" with "5,4"
      And I fill in "Tmax" with "1,5"
      And I fill in "T1/2" with "14"
      And I fill in "Poids moléculaire" with "important (2000-8000)"
      And I select "dose dépendant" from "Passage dans le lait"
      And I select ">1" from "Rapport Lait/Plasma"
      And I check "Posologie pédiatrique"
      And I fill in "à partir de" with "6 mois"
      And I check "Métabolites actifs"
      And I check "Risque d'accumulation dans le lait"
      And I check "Risque théorique de diminution de la lactation"
      And I fill in "Autres" with "passage systémique quasi nul"

  Scenario: creating detailed fiches
    Given a distinction exists with name: "indication"
    When I go to the dci's new fiche page
      And I select "indication" from "Sous-type fiche"
      And I fill in "fiche[distinction_name]" with "épilepsie"
      And I fill in "fiche[ei]" with "1 cas d'acidose métabolique"
      And I fill in "Conditions" with "si pas d'alternative utilisable"
      And I fill in "fiche[surveillance]" with "l'apparition de troubles digestifs"
      And I fill in "Alternatives" with "desloratadine, cétirizine, ampicilline"
      And I press "Sauvegarder"
    Then 1 fiches should exist
