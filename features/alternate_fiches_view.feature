Feature: auth users can alternate viewing fiches valide/non valide 
  In order to focus on fiches with specific states
  As an auth user
  I want to be able to alternate between viewing fiches valide/non valide

  Background:
    Given I am logged in as a contributeur
    And a dci exists

  Scenario: hide link for guest users
    Given I am not authenticated
    And the following fiches exist:
      | dci           | distinction_name  | state     |
      | the first dci | dist1             | valide    |
      | the first dci | dist2             | brouillon |
    When I go to the dci page
    Then I should see "dist1"
    But I should not see "Voir les fiches non validées"

  Scenario: alternate link if fiches of both valide and non valide states
    Given the following fiches exist:
      | dci           | distinction_name  | state     |
      | the first dci | dist1             | valide    |
      | the first dci | dist2             | brouillon |
    When I go to the dci page
    And I follow "Voir les fiches non validées"
    Then I should see "Voir les fiches validées"
    And I should see "dist2"

  Scenario Outline: hide opposite state fiches link if one state only
    Given a fiche exists with dci: the first dci, distinction_name: "dist1", state: "<state>"
    When I go to the dci page
    Then I should see "dist1"
    But I should not see "<link>"

    Scenarios:
      | state      | link                         |
      | valide     | Voir les fiches non validées |
      | brouillon  | Voir les fiches validées     |
      | a_valider  | Voir les fiches validées     |
      | en_attente | Voir les fiches validées     |
