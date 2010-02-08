When(/a validated fiche$/) do
  @fiche = Factory(:fiche,
                    :state => "valide",
                    :validation_date => "#{Time.now.to_date}")
end

When(/(\d+) validated fiches$/) do |number|
  Then "#{number} fiches exist with state: \"valide\""
end

When(/I should have (\d+) validated fiche$/) do |number|
  Then "#{number} fiches should exist with state: \"valide\""
end

Given(/^I don't have any fiches$/) do
  Fiche.destroy_all
end

When(/^a fiche exists which has been validated today$/) do
  Then "a fiche exists with state: \"valide\", validation_date: \"#{Time.now.to_date}\""
end

When(/(.*) the validation date$/) do |action|
  Then "#{action} \"#{Time.now.strftime("%d/%m/%Y")}\""
end

When(/see when it's been updated last$/) do
  response.should contain("#{time_ago_in_words(@fiche.validation_date)}")
end

When(/^I walk to its page$/) do
  visit fiche_path(@fiche)
end
