# encoding: utf-8
module FichesHelper
  def validation_state_and_actions
    haml_tag :table do
      haml_tag :tr do
        haml_tag :th do
          haml_concat("Validation : ")
        end
        haml_tag :td do
          haml_concat(@fiche.state.humanize)
        end
        validate_actions_buttons
      end
      haml_tag :tr do
        haml_tag :th do
        end
        if @fiche.state == "valide"
          haml_tag :td do
            haml_concat(" (MAJ ")
            haml_concat(l(@fiche.validation_date))
            haml_concat(")")
          end
          haml_tag :td do
            haml_concat(" => ")
          end
          haml_tag :td do
            haml_concat(link_to("Mettre à jour", maj_date_dci_fiche_path(@fiche.dci, @fiche), :method => :put)) unless @fiche.validation_date == Time.now.to_date
          end
        end
      end
    end
  end

  def validate_actions_buttons
    haml_tag :td do
      haml_concat(" => ")
    end
    if @fiche.state == "brouillon" && permitted_to?(:initialiser)
      haml_tag :td, {:class => 'val_actions'} do
        haml_concat(link_to("Initialiser", initialiser_dci_fiche_path(@fiche.dci, @fiche), :method => :put))
      end
    elsif (@fiche.state == "a_valider" || @fiche.state == "en_attente") && permitted_to?(:valider, @fiche)
      haml_tag :td, {:class => 'val_actions'} do
        haml_concat(link_to("Valider", valider_dci_fiche_path(@fiche.dci, @fiche), :method => :put))
      end
    elsif @fiche.state == "valide" && permitted_to?(:invalider, @fiche)
      haml_tag :td, {:class => 'val_actions'} do
        haml_concat(link_to("Invalider", invalider_dci_fiche_path(@fiche.dci, @fiche), :method => :put))
      end
    end
  end
end
