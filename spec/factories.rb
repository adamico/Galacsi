Factory.define :page do |f|
  f.sequence(:permalink) {|n| "permalink#{n}"}
  f.title "a title"
  f.content "a content"
end

Factory.define :home_page, :parent => :page do |f|
  f.permalink "home"
end

Factory.define :fiche do |f|
  f.validation_date "#{Time.now.to_date}"
  f.revalider_le "#{Time.now.advance(:months => -4).to_date}"
  f.commentaire 'blabla'
  f.distinction_name 'hta'
  f.suivi 'oui'
  f.state 'brouillon'
end

Factory.define :fiche_a_valider, :parent => :fiche do |f|
  f.state "a_valider"
end

Factory.define :fiche_valide, :parent => :fiche do |f|
  f.state "valide"
end

Factory.define :fiche_en_attente, :parent => :fiche do |f|
  f.state "en_attente"
end

Factory.define(:distinction) do |f|
  f.sequence(:name) {|n| "dist#{n}"}
end

Factory.define :dci do |f|
  f.sequence(:name) {|n| "dci#{n}" }
end

Factory.define :decision do |f|
  f.name "Compatible"
end

Factory.define :composition do |f|
  f.association :specialite
  f.association :dci
end

Factory.define :classification do |f|
  f.association :classe_therapeutique
  f.association :dci
end

Factory.define :specialite  do |f|
  f.sequence(:name) {|n| "specialite#{n}"}
end

Factory.define :classe_therapeutique do |f|
  f.sequence(:name) { |n| "classe#{n}" }
end

Factory.define :user do |f|
  f.sequence(:username) {|n| "username#{n}"}
  f.email { |a| "#{a.username}@example.com".downcase }
  f.password "password"
  f.password_confirmation { |user| user.password }
end

Factory.define :valideur, :parent => :user do |f|
  f.role "valideur"
end

Factory.define :contributeur, :parent => :user do |f|
  f.role "contributeur"
end
