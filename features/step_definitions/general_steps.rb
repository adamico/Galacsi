When(/^I submit$/) do
  steps %Q{
    When I press "Enregistrer"
  }
end

When(/^I fill in the search form with "([^\"]*)"$/) do |search|
  steps %Q{
    When I fill in "search[name_or_stripped_name_or_specialites_name_or_classe_therapeutiques_name_or_classe_therapeutiques_stripped_name_like]" with "#{search}"
  }
end
