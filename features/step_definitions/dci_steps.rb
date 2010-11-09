Given(/^I have no dcis$/) do
  Dci.destroy_all
  Dci.all.should be_empty
end

Then(/^I should see the following dcis:$/) do |expected_table|
  actual_table = table(tableish('table#list tr', 'th,td'))
  actual_table.map_column!('Fiche(s)') {|text| text.gsub(/\n/, ' ')}
  expected_table.diff!(actual_table)
end
