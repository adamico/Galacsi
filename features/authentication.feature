Feature: user besides guest must authenticate
  In order to restrict write access to authorized users
  A user
  Should authenticate themselves to the application
  To avoid wasting time

  Scenario Outline: user tries to authenticate
    Given a user exists with username: "myuser", password: "mypass"
    When they visit the user authentication page
      And they enter the user_username "<username>"
      And they enter the user_password "<password>"
      And they press the authenticate button
    Then they should <expectation> an authentication success message
    Examples:
      | username  | password  | expectation |
      | myuser    | mypass    | see         |
      | tizio     | pass      | not see     |

  Scenario Outline: log in as a user with role
    When I am logged in as a <role>
    Then show me the page
    Then I should see "Déconnection"
    Examples:
      | role   |
      | contributeur |
      | valideur |


  Scenario: log out
    Given I am logged in as a contributeur
    When I follow "Déconnection"
    Then I should see "Déconnection effectuée avec succès."
      And I should see "Connection"
