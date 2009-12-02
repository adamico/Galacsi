Feature: initialize produits
  In order to assess drugs safety during breastfeeding
  As an authorized user
  I want to be able to initialize produits

  Scenario: list non validated produits
    When I am logged in as a contributeur
      And I go to the produits page
    Then I should see "Produits non validés"

  Scenario: create a produit
    When I am logged in as a contributeur
      And I go to the produits page
      And I follow "Nouveau produit"
      And I fill in "nom" with "lamotrigine"
      And I press "Sauvegarder"
    Then a produit should exist

  Scenario Outline: show edit produit link when authorized
    Given a produit exists
    When I am logged in as a <role>
      And I go to the produit's page
      Then I should <action> to modify it
    Examples:
      | role          | action     |
      | admin         | be allowed |
      | saisisseur    | be allowed |
      | valideur      | be allowed |
      | contributeur  | be allowed |

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
