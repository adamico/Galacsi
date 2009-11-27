Feature: manage produits
  In order to enter new cases in galacsi
  As a user
  I want to be able to list, show, create and update produits

  Background:
    Given a produit exists with validation: "1"

  Scenario Outline: show edit produit link when authorized
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
    When I go to the produit's page
    Then I should not see "Modifier"

  Scenario: create a produit
    When I am logged in as a contributeur
      And I go to the produits page
      And I follow "Nouveau produit"
      And I fill in "nom" with "lamotrigine"
      And I press "Sauvegarder"
    Then a produit should exist with name: "lamotrigine"

  Scenario: update a produit
      And I am logged in as a contributeur
    When I go to the produit's edit page
      And I fill in "nom" with "lamotrigina"
      And I press "Sauvegarder"
    Then a produit should exist with name: "lamotrigina"

@valideur
  Scenario: validate prouits as valideur
    Given a non validated produit exists
      And I am logged in as a valideur
    When I go to the produit's page
      And I follow "Valider"
    Then I should see "Successfully validated produit."
      And I should have 1 validated produit

  Scenario: hide validate link if validated produit
    When I go to the produit's page
    Then I should not see "Valider"

@valideur
  Scenario: list nonvalidated produits as valideur
    Given 5 non validated produits exist
      And I am logged in as a user in the valideur role
    When I go to the produits page
      And I follow "Produits non validés"
    Then I should see "Produits à valider (5)"
