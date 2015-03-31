require 'rails_helper'

feature 'Searching dcis' do
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

  background do
    create(:composition, dci: dci1, specialite: specialite1)
    create(:composition, dci: dci2, specialite: specialite2)
    create(:composition, dci: dci3, specialite: specialite3)
    create(:composition, dci: dci4, specialite: specialite4)
    create(:fiche, dci: dci1, distinction: distinction1, distinction_name: 'Orale', state: 'valide')
    create(:fiche, dci: dci1, distinction: distinction1, distinction_name: 'IV', state: 'brouillon')
    create(:fiche, dci: dci2, distinction: distinction2, distinction_name: 'Cardiologie', state: 'a_valider')
    create(:fiche, dci: dci2, distinction: distinction2, distinction_name: 'Antalgique', state: 'a_valider')
    create(:fiche, dci: dci3, distinction: distinction3, distinction_name: 'Haut', state: 'valide')
    create(:fiche, dci: dci4, distinction: distinction3, distinction_name: 'Bas', state: 'en_attente')
  end

  describe 'unfructuous' do
    background { visit search_path }

    scenario 'by DCI' do
      fill_in 'Par principe actif', with: 'bla'
      within '#fiche_dcis_search' do
        click_on 'OK'
      end
      expect(page).to have_content("Aucun résultat pour 'bla' dans les noms de DCI")
    end

    scenario 'by specialite' do
      fill_in 'Par spécialité', with: 'bla'
      within '#fiche_specialites_search' do
        click_on 'OK'
      end
      expect(page).to have_content("Aucun résultat pour 'bla' dans les noms de spécialité")
    end
  end

  describe 'successful' do
    background { visit search_path }

    scenario 'for dci match' do
      fill_in 'Par principe actif', with: 'dci1'
      within '#fiche_dcis_search' do
        click_on 'OK'
      end
      expect(page).to have_content("Dci1 Voie : Orale")
    end

    scenario 'for specialite match' do
      fill_in 'Par spécialité', with: 'specialite1'
      within '#fiche_specialites_search' do
        click_on 'OK'
      end
      expect(page).to have_content("Dci1 Voie : Orale")
    end

    scenario 'unauthorized users can only see valid fiches' do
      within '#fiche_dcis_search' do
        click_on 'OK'
      end
      expect(page).to have_content('Dci1 Voie : Orale')
      expect(page).to have_content('Dci3 Dosage : Haut')
    end
  end
end
