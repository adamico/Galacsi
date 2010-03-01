Factory.define :fiche do |f|
  f.state 'brouillon'
  f.validation_date "#{Time.now.to_date}"
  f.revalider_le "#{Time.now.advance(:months => -4).to_date}"
  f.commentaire 'blabla'
  f.distinction_name 'hta'
  f.association :decision
  f.association :dci
  f.association :distinction
  f.suivi 'oui'
end

Factory.define(:distinction) do |f|
  f.name "indication"
end

Factory.define :dci do |f|
  f.sequence(:name) {|n| "dci#{n}" }
  f.specialites { |specialites| [specialites.association(:specialite)]}
  f.classe_therapeutiques { |classe_therapeutiques| [classe_therapeutiques.association(:classe_therapeutique)]}
end

Factory.define :decision do |f|
  f.name "Compatible"
end

Factory.define(:specialite) do |f|
  f.sequence(:name) {|n| "specialite#{n}"}
end

Factory.define :classe_therapeutique do |f|
  f.sequence(:name) { |n| "classe#{n}" }
end

Factory.define :user do |f|
  f.sequence(:username) {|n| "user#{n}"}
  f.email { |a| "#{a.username}@example.com".downcase }
  f.password "secret"
  f.password_confirmation { |user| user.password }
  f.role "contributeur"
end

Factory.define :admin, :parent => :user do |f|
  f.role "admin"
end

Factory.define :valideur, :parent => :user do |f|
  f.role "valideur"
end

Factory.define :contributeur, :parent => :user do |f|
  f.role "contributeur"
end
