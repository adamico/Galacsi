#encoding: utf-8
namespace :db do
  desc "Populate database"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    seed_decisions
    seed_distinctions
    seed_classes
  end
end

#seed_dcis
#seed_fiches

def seed_decisions
  decisions = [ "contre-indiqué", "à discuter", "compatible", "sous conditions"]
  abbrev = %w[ci ad comp sc]

  decisions.each_with_index do |d, i|
    Decision.create(:name => d, :abbr => abbrev[i])
  end
end


def seed_distinctions
  distinctions = [
    "indication",
    "voie",
    "dosage"
  ]
  distinctions.each do |dist|
    Distinction.create(:name => dist)
  end
end

def seed_classes
  classes = [ "Analgésique - Antiinflammatoire", "Anesthésie et réanimation", "Antibiotique et Antibactérien", "Antiparasitaire", "Antiviral", "Cancérologie", "Cardiologie et angiologie", "Dermatologie", "Endocrinologie - Troubles Métaboliques", "Gastro-entéro-hépatologie", "Gynécologie-obstétrique", "Hemostase", "Immuno-allergologie", "Inclassables", "Neurologie", "Ophtalmologie", "Oto-rhino-laryngologie", "Phytothérapie", "Pneumologie", "Produit de contraste", "Psychiatrie - Antidépresseur", "Psychiatrie - Anxiolytique", "Psychiatrie - Hypnotique", "Psychiatrie - Neuroleptique", "Rhumatologie", "Substitution", "Urologie", "Vaccin"]

  classes.each do |c|
    ClasseTherapeutique.create(:name => c)
  end
end

def seed_dcis
  
end

def seed_fiches
  
end
