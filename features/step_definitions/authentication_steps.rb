def user
  @user ||= Factory(:user)
end

def login
  user
  visit root_url
  response.should contain("Log in")
  click_link "Log in"
  fill_in "Utilisateur", :with => user.username
  fill_in "Mot de passe", :with => user.password
  click_button "Se connecter"
end

When /user authentication page$/ do
  visit new_user_session_url
end

When /enter the username "(.*)"$/ do |name|
  Then "I fill in \"Utilisateur\" with \"#{name}\""
end

When /enter the password "(.*)"$/ do |password|
  Then "I fill in \"Mot de passe\" with \"#{password}\""
end

When /press the authenticate button$/ do
  Then "I press \"Se connecter\""
end

When /see an authentication success message$/ do
  have_selector("#authenticated_session_header")
end

When /^I login$/ do
  login
end

When /^I am logged in$/ do
  login
end
