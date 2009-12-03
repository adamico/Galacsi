Feature: contribute produits
  In order to assess drugs safety during breastfeeding
  As an authorized user
  I want to be able to create produits

  Scenario: new produit has validation 0 by default
    Given I am logged in as a contributeur
    When I go to the produits page
      And I follow "Nouveau produit"
      And I fill in "nom" with "lamotrigine"
      And I press "Sauvegarder"
    Then a produit should exist with validation: 0

@focus
  Scenario Outline: show edit produit link when authorized
    Given a produit exists with validation: <validation>
      And I am logged in as a contributeur
    When I go to the produit's page
      Then I should <action> "Modifier"
    Examples:
      | validation  | action  |
      | 0           | see     |
      | 1           | see     |
      | 2           | not see |
      | 3           | not see |

  # a non authentified user has a 'guest' role for declarative authorization
  Scenario: hide edit produit link as guest
    Given a produit exists
    When I go to the produit's page
    Then I should not see "Modifier"

  Scenario: update a produit
    Given a produit exists with name: "lamotrigine"
      And I am logged in as a contributeur
    When I go to the produit's edit page
      And I fill in "nom" with "lamotrigina"
      And I press "Sauvegarder"
    Then a produit should exist with name: "lamotrigina"
