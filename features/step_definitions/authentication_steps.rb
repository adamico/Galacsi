When(/authentication page$/) do
  visit('/users/sign_in')
end

Given(/^I am not authenticated$/) do
  visit('/users/sign_out')
end

When(/signout$/) do
  steps %Q{
    Given I am not authenticated
  }
end

When(/enter the (.*) "(.*)"$/) do |field, value|
  steps %Q{
    When I fill in "#{field}" with "#{value}"
  }
end

When(/press the authenticate button$/) do
  Then "I press \"Connexion\""
end

When(/see an authentication success message$/) do
  have_selector("#authenticated_session_header")
end

When(/I login with "(.*)"/) do |username|
  steps %Q{
    When I visit the authentication page
    When I fill in "Nom d'utilisateur" with "#{username}"
    When I fill in "Mot de passe" with "password"
    When I press the authenticate button
  }
end

When(/I am logged in as an? #{capture_model}$/) do |role|
  Given "a #{role} exists"
  user = model!(role)
  steps %Q{
    And I am not authenticated
    When I login with "#{user.username}"
    Then I should see an authentication success message
  }
end
