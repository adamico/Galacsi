Feature: Creating fiches for dci
  In order to have different lactation use case for dcis
  As a galacsi contributor
  I want to create fiches according to different criteria

  Scenario: adding alternatives to fiches
    Given I am logged in as a contributeur
      And a dci exists
    When I go to the dci's new fiche page
      And I fill in "Alternatives" with "desloratadine, cétirizine, ampicilline"
      And I submit
    Then I should see "Alternatives :"
      And I should see "desloratadine"
      And I should see "cétirizine"
      And I should see "ampicilline"
