Feature: validate produits
  As a user
  I want to move up produits in the validation workflow
  In order to have up to date informations for taking drug during breastfeeding

  Background:
    Given the following produits exist
      | state     |
      | brouillon |
      | a_valider |
      | valide    |
      | gele      |

  Scenario Outline: hide validation link if guest
    When I go to the <position> produit's page
    Then I should not see "Valider"
    Scenarios:
      | position |
      | first    |
      | 2nd      |
      | 3rd      |
      | 4th      |

  Scenario Outline: contributeurs can push "brouillon" to "à_valider"
    Given I am logged in as a contributeur
    When I go to the <position> produit's page
    Then I should <action> "Valider"
    Scenarios:
      | position | action  |
      | first    | see     |
      | 2nd      | not see |

  Scenario Outline: valideurs can push produits up to "validé"
    Given I am logged in as a valideur
    When I go to the <position> produit's page
    Then I should <action> "Valider"
    Scenarios:
      | position | action  |
      | first    | see     |
      | 2nd      | see     |

  Scenario: produits "validés" can't be pushed further up
    Given I am logged in as a valideur
    When I go to the 3rd produit's page
    Then I should not see "Valider"

  Scenario: produits "validés" can be "gelés"
    Given I am logged in as a valideur
    When I go to the 3rd produit's page
    Then I should see "Geler"

  @focus
  Scenario: produits "gelés" can be made "validés" again
    Given I am logged in as a valideur
    When I go to the 4th produit's page
    Then I should see "Revalider"
