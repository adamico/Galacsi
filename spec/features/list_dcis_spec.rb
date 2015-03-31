require 'rails_helper'

feature 'List dcis' do
  delegate :t, to: I18n
  given(:user) { create(:contributeur) }

  background do
    visit new_user_session_path
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_on t('devise.sessions.new.submit')
  end
  given(:dci1) { create(:dci, name: 'dci1') }
  given(:dci2) { create(:dci, name: 'dci2') }
  given(:dci3) { create(:dci, name: 'dci3') }
  given(:dci4) { create(:dci, name: 'dci4') }
  given(:specialite1) { create(:specialite, name: 'specialite1') }
  given(:specialite2) { create(:specialite, name: 'specialite2') }
  given(:specialite3) { create(:specialite, name: 'specialite3') }
  given(:specialite4) { create(:specialite, name: 'specialite4') }
  given(:distinction1) { create(:distinction, name: 'Voie') }
  given(:distinction2) { create(:distinction, name: 'Indication') }
  given(:distinction3) { create(:distinction, name: 'Dosage') }
  given(:ct1) { create(:classe_therapeutique, name: 'ct1') }
  given(:ct2) { create(:classe_therapeutique, name: 'ct2') }

  background do
    create(:composition, dci: dci1, specialite: specialite1)
    create(:composition, dci: dci2, specialite: specialite2)
    create(:composition, dci: dci3, specialite: specialite3)
    create(:composition, dci: dci4, specialite: specialite4)
    create(:classification, dci: dci1, classe_therapeutique: ct1)
    create(:classification, dci: dci2, classe_therapeutique: ct1)
    create(:classification, dci: dci3, classe_therapeutique: ct2)
    create(:classification, dci: dci4, classe_therapeutique: ct2)
    create(:fiche, dci: dci1, distinction: distinction1, distinction_name: 'Orale', state: 'valide')
    create(:fiche, dci: dci1, distinction: distinction1, distinction_name: 'IV', state: 'brouillon')
    create(:fiche, dci: dci2, distinction: distinction2, distinction_name: 'Cardiologie', state: 'a_valider')
    create(:fiche, dci: dci2, distinction: distinction2, distinction_name: 'Antalgique', state: 'a_valider')
    create(:fiche, dci: dci3, distinction: distinction3, distinction_name: 'Haut', state: 'valide')
    create(:fiche, dci: dci4, distinction: distinction3, distinction_name: 'Bas', state: 'en_attente')
  end

  scenario 'no dcis found' do
    Dci.destroy_all
    visit dcis_path
    expect(page).to have_content("Aucune DCI dans la base")
  end

  scenario 'shows all dcis' do
    visit dcis_path
    expect(page).to have_content('Dci1 Specialite1 Ct1 2 (1 non validée)')
    expect(page).to have_content('Dci2 Specialite2 Ct1 2 (2 non validées)')
    expect(page).to have_content('Dci3 Specialite3 Ct2 1')
    expect(page).to have_content('Dci4 Specialite4 Ct2 1 (1 non validée)')
  end
end
