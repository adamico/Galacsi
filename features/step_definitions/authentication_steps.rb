def user(role)
  @user ||= Factory(:role.to_sym)
end

def login(role)
  auser = user(role)
  visit root_url
  response.should contain("Connection")
  click_link "Connection"
  fill_in "Utilisateur", :with => auser.username
  fill_in "Mot de passe", :with => auser.password
  click_button "Se connecter"
end

Given(/^I am not authenticated$/) do
  visit('/users/sign_out')
end

When(/user authentication page$/) do
  visit new_user_session_url
end

When(/enter the username "(.*)"$/) do |name|
  Then "I fill in \"Utilisateur\" with \"#{name}\""
end

When(/enter the password "(.*)"$/) do |password|
  Then "I fill in \"Mot de passe\" with \"#{password}\""
end

When(/press the authenticate button$/) do
  Then "I press \"Se connecter\""
end

When(/see an authentication success message$/) do
  have_selector("#authenticated_session_header")
end

When(/^I login$/) do
  login
end

When(/^I am logged in$/) do
  login
end
