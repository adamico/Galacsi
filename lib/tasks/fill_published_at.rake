namespace :db do
  desc "Fill fiche#published_at with fiche#validation_date value"
  task :fill_published_at => :environment do
    puts "Preparing to fill fiche#published_at with fiche#validation_date...\n\n"
    puts "Checking records :\n"
    puts "#{Fiche.all.size} total fiche(s) found.\n"
    fiches = Fiche.all.reject {|fiche| fiche.validation_date.nil? }
    puts "#{fiches.size} fiche(s) with non empty validation_date field found.\n"
    fiches.reject! {|fiche| !fiche.published_at.nil? }
    puts "#{fiches.size} fiche(s) with empty published_at field found.\n\n"
    counter = 0
    if fiches.empty?
      puts "Nothing done."
    else
      puts "Starting...\n"
      fiches.each do |fiche|
        fiche.published_at = fiche.validation_date
        fiche.save
        counter += 1
      end
      puts "#{counter} records processed successfully.\n"
    end
  end
end
