# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
#

decisions = [ "contre-indiqué", "à discuter", "compatible", "sous conditions"]
Decision.delete_all
decisions.each do |d|
  Decision.find_or_create_by_name(d)
end

classes = [ "Analgésique - Antiinflammatoire", "Anesthésie et réanimation", "Antibiotique et Antibactérien", "Antiparasitaire", "Antiviral", "Cancérologie", "Cardiologie et angiologie", "Dermatologie", "Endocrinologie - Troubles Métaboliques", "Gastro-entéro-hépatologie", "Gynécologie-obstétrique", "Hemostase", "Immuno-allergologie", "Inclassables", "Neurologie", "Ophtalmologie", "Oto-rhino-laryngologie", "Phytothérapie", "Pneumologie", "Produit de contraste", "Psychiatrie - Antidépresseur", "Psychiatrie - Anxiolytique", "Psychiatrie - Hypnotique", "Psychiatrie - Neuroleptique", "Rhumatologie", "Substitution", "Urologie", "Vaccin"]

classes.each do |c|
  ClasseTherapeutique.find_or_create_by_name(c)
end
