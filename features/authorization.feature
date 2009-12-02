Feature: user besides guest must authenticate
  In order to restrict write access to authorized users
  A user
  Should authenticate themselves to the application
  To avoid wasting time

  Background:
    Given a user exists with username: "myuser", password: "mypass"

  Scenario Outline: user tries to authenticate
    When they visit the user authentication page
      And they enter the username "<username>"
      And they enter the password "<password>"
      And they press the authenticate button
    Then they should <expectation> an authentication success message
    Examples:
      | username  | password  | expectation |
      | myuser    | mypass    | see         |
      | tizio     | pass      | not see     |

  Scenario: log in
    When I login
    Then I should see an authentication success message
      And I should see "Déconnection"

  Scenario: log out
    Given I am logged in
    When I follow "Déconnection"
    Then I should see "Vous étes déconnectés."
      And I should see "Connection"
