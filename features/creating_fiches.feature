Feature: Creating fiches for dci
  In order to have different lactation use case for dcis
  As a galacsi contributor
  I want to create fiches according to different criteria
  
  Scenario: creating a fiche for an existing dci
    Given a dci exists
    When I go to the dci's page
      And I follow "Nouvelle fiche"
      And I select "Indication" from "distinction_type"
      And I fill in "distinction" with "épilepsie"
      And I press "Sauvegarder"
    Then a fiche should exist  

  
