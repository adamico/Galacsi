require 'rails_helper'

feature 'Validate fiches' do
  #In order to quickly access non validated fiches
  #As a valideur
  #I want to list fiches without opening dcis and filter them by state
  #and validate/invalidate them
  delegate :t, to: I18n
  given!(:user) { login(create(:valideur)) }
  given(:dci1) { create(:dci) }
  given(:dci2) { create(:dci) }
  given(:dci3) { create(:dci) }
  given(:distinction1) { create(:distinction, name: 'Voie') }
  given(:distinction2) { create(:distinction, name: 'Indication') }

  background do
    create(:fiche, dci: dci1, distinction: distinction1, distinction_name: 'Orale', state: 'brouillon')
    create(:fiche, dci: dci1, distinction: distinction1, distinction_name: 'IV', state: 'brouillon')
    create(:fiche, dci: dci2, distinction: distinction2, distinction_name: 'Cardiologie', state: 'a_valider')
    create(:fiche, dci: dci3, distinction: distinction2, distinction_name: 'Antalgique', state: 'a_valider')
    visit fiches_path
  end

  scenario 'show list of all fiches when no filter' do
    expect(page).to have_content('Voie : Orale')
    expect(page).to have_content('Voie : Iv')
    expect(page).to have_content('Indication : Cardiologie')
    expect(page).to have_content('Indication : Antalgique')
  end

  scenario 'filter fiches by state' do
    select 'brouillon', from: 'Etat de validation'
    click_on 'OK'
    expect(page).to have_content('Voie : Orale')
    expect(page).to have_content('Voie : Iv')
  end

  scenario 'validate fiche' do

  end
end
