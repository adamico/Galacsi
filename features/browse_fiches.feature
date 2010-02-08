Feature: browse fiches according to permissions
  In order to show correct information for drug use during breastfeeding
  As a user
  I want to show fiches according to user permissions

  Background:
    Given the following fiches exist
    | name      | state     |
    | brou      | brouillon |
    | aval      | a_valider |
    | vali      | valide    |
    | enat      | en_attente|

  Scenario: hide validation field for guest users
    When I go to the fiches page
    Then I should not see "Validation"
      And I should not see "valide"

  Scenario: browse fiches
