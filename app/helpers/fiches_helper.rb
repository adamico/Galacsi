# encoding: utf-8
module FichesHelper
  #TODO demander à AG si elle préfère avoir ça:
  # %p<
  #   %strong Validation :
  #   = " #{@fiche.state.humanize}" rescue ""
  # - if @fiche.state == "valide"
  #   %p<
  #     %strong Date de MAJ :
  #     = " " + l(@fiche.validation_date) rescue " A renseigner"
  def validation_state_and_actions
    haml_tag :p do
      if has_role? :guest
        if @fiche.validation_date.blank?
          nil
        else
          haml_tag :small do
            haml_concat("(Informations validées il y a ")
            haml_tag :em do
              haml_concat(time_ago_in_words(@fiche.validation_date))
            end
            haml_concat(")")
          end
        end
      else
        haml_tag :strong, "Validation : "
        haml_concat(@fiche.state.humanize)
        if @fiche.state == "valide"
          haml_concat(" (MAJ le")
          haml_concat(l(@fiche.validation_date))
          haml_concat(")")
        end
        validate_actions_buttons
      end
    end
  end

  def validate_actions_buttons
    if @fiche.state == "brouillon" && permitted_to?(:initialiser)
      haml_tag :span, {:class => 'val_actions'} do
        haml_concat(link_to("Initialiser", initialiser_dci_fiche_path(@fiche.dci, @fiche), :method => :put))
      end
    elsif (@fiche.state == "a_valider" || @fiche.state == "en_attente") && permitted_to?(:valider, @fiche)
      haml_tag :span, {:class => 'val_actions'} do
        haml_concat(link_to("Valider", valider_dci_fiche_path(@fiche.dci, @fiche), :method => :put))
      end
    elsif @fiche.state == "valide" && permitted_to?(:invalider, @fiche)
      haml_tag :span, {:class => 'val_actions'} do
        haml_concat(link_to("Mettre à jour", maj_date_dci_fiche_path(@fiche.dci, @fiche), :method => :put)) unless @fiche.validation_date == Time.now.to_date
      end
      haml_tag :span, {:class => 'val_actions'} do
        haml_concat(link_to("Invalider", invalider_dci_fiche_path(@fiche.dci, @fiche), :method => :put))
      end
    end
  end
end
