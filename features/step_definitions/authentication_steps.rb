def user(role)
  @user ||= Factory(role.to_sym)
end

def login(role)
  auser = user(role)
  visit root_url
  response.should contain("Connection")
  click_link "Connection"
  fill_in "Nom d'utilisateur", :with => auser.username
  fill_in "Mot de passe", :with => auser.password
  click_button "Connection"
end

Given(/^I am not authenticated$/) do
  visit('/users/sign_out')
end

When(/user authentication page$/) do
  visit('/users/sign_in')
end

When(/enter the username "(.*)"$/) do |name|
  Then "I fill in \"Nom d'utilisateur\" with \"#{name}\""
end

When(/enter the password "(.*)"$/) do |password|
  Then "I fill in \"Mot de passe\" with \"#{password}\""
end

When(/press the authenticate button$/) do
  Then "I press \"Connection\""
end

When(/see an authentication success message$/) do
  have_selector("#authenticated_session_header")
end

When(/(login|logged in) as an? (.*)$/) do |skip, role|
  login(role)
end
