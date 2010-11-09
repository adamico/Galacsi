def today
  Time.now.to_date
end

When(/^a fiche exists which has been validated today$/) do
  Then "a fiche exists with dci: the dci, state: \"valide\", validation_date: \"#{today}\""
end

Then(/^the validation date should be today$/) do
  Then "I should see \"MAJ #{Time.now.strftime("%d/%m/%Y")}\""
end

When(/(.*) the validation date$/) do |action|
  Then "#{action} \"#{Time.now.strftime("%d/%m/%Y")}\""
end

When(/see when it's been updated last$/) do
  response.should contain("#{time_ago_in_words(today)}")
end

Then(/^I should be at the (.*?) page$/) do |page|
  if page =~ /#{capture_model}'s/
    url_for(model($1))
  end
end

Then(/^I should see fiches table$/) do |table|
  # table is a Cucumber::Ast::Table
  table.diff!(tableish('table#fiches tr', 'td,th'))
end

Then(/^I should see the following search results:$/) do |expected_table|
  actual_table = table(tableish('table#list tr', 'th,td'))
  expected_table.diff!(actual_table)
end
