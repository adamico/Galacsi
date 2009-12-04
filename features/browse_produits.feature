Feature: browse produits according to permissions
  In order to show correct information for drug use during breastfeeding
  As a user
  I want to show produits according to user permissions

  Background:
    Given the following produits exist
    | state     |
    | brouillon |
    | a_valider |
    | valide    |
    | gele      |

  Scenario Outline: show produits list according to user role permissions
    When I am logged in as a <role>
      And I go to the produits page
    Then I should see "<count> résultats"
    Scenarios:
      | role          | count |
      | valideur      | 4     |
      | contributeur  | 4     |

  Scenario: show only validated produits as guest
    When I go to the produits page
    Then I should see "1 résultat"
