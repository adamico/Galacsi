Feature: search fiches
  In order to quickly access non validated fiches
  As a valideur
  I want to list fiches without opening dcis and filter them by state

  Background:
    Given I am logged in as a valideur
    And the following distinctions exist
      | name      |
      | indication|
      | voie      |
    And the following dcis exist
      | name |
      | dci1 |
      | dci2 |
      | dci3 |
    And the following fiches exist
      | dci         | distinction         | distinction_name | state    |
      | the 1st dci | the 1st distinction | ind1             | brouillon|
      | the 1st dci | the 1st distinction | ind2             | brouillon|
      | the 2nd dci | the 2nd distinction | voie1            | a_valider|
      | the 3rd dci | the 2nd distinction | voie2            | a_valider|

  Scenario: show list of all fiches when no filter
    When I go to the fiches page
    And I press "OK"
    Then I should see fiches table
      | dci1  | indication : ind1 | Brouillon |
      | dci1  | indication : ind2 | Brouillon |
      | dci2  | voie : voie1      | A valider |
      | dci3  | voie : voie2      | A valider |

  Scenario: filter fiches by state
    When I go to the fiches page
    And I select "Brouillon" from "Etat de validation"
    And I press "OK"
    Then I should see fiches table
      | dci1  | indication : ind1 | Brouillon |
      | dci1  | indication : ind2 | Brouillon |
