# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
decision_names = ["Contre-indiqué", "A discuter", "Compatible", "Compatible 2e intention"]
decision_names.each do |name|
  Decision.create(:name => name)
end
