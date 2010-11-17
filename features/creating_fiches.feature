Feature: Creating fiches for dci
  In order to have different lactation use case for dcis
  As a galacsi contributor
  I want to create fiches according to different criteria

  Background:
    Given a dci exists
      And I am logged in as a contributeur

  Scenario: creating a blank fiche
    When I go to the dci's new fiche page
    And I submit
    Then 1 fiches should exist

  Scenario: creating a fiche with alternatives
    When I go to the dci's new fiche page
      And I fill in "Alternatives" with "desloratadine, cétirizine, ampicilline"
      And I submit
    Then I should see "Alternatives :"
      And I should see "desloratadine"
      And I should see "cétirizine"
      And I should see "ampicilline"

  Scenario: creating a fiche with sources
