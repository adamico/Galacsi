# encoding:utf-8
module ProduitsHelper
  #TODO demander à AG si elle préfère avoir ça:
  # %p<
  #   %strong Validation :
  #   = " #{@produit.state.humanize}" rescue ""
  # - if @produit.state == "valide"
  #   %p<
  #     %strong Date de MAJ :
  #     = " " + l(@produit.validation_date) rescue " A renseigner"
  def validation_state_and_actions
    haml_tag :p do
      if has_role? :guest
        if @produit.validation_date.blank?
          nil
        else
          haml_tag :small do
            haml_concat("(Informations validées il y a ")
            haml_tag :em do
              haml_concat(time_ago_in_words(@produit.validation_date))
            end
            haml_concat(")")
          end
        end
      else
        haml_tag :strong, "Validation : "
        haml_concat(@produit.state.humanize)
        if @produit.state == "valide"
          haml_concat(" (MAJ le")
          haml_concat(l(@produit.validation_date))
          haml_concat(")")
        end
        validate_actions_buttons
      end
    end
  end

  def validate_actions_buttons
    if @produit.state == "brouillon" && permitted_to?(:initialiser)
      haml_tag :span, {:class => 'val_actions'} do
        haml_concat(link_to("Initialiser", initialiser_produit_path(@produit), :method => :put))
      end
    elsif (@produit.state == "a_valider" || @produit.state == "en_attente") && permitted_to?(:valider, @produit)
      haml_tag :span, {:class => 'val_actions'} do
        haml_concat(link_to("Valider", valider_produit_path(@produit), :method => :put))
      end
    elsif @produit.state == "valide" && permitted_to?(:invalider, @produit)
      haml_tag :span, {:class => 'val_actions'} do
        haml_concat(link_to("Mettre à jour", maj_date_produit_path(@produit), :method => :put)) unless @produit.validation_date == Time.now.to_date
      end
      haml_tag :span, {:class => 'val_actions'} do
        haml_concat(link_to("Invalider", invalider_produit_path(@produit), :method => :put))
      end
    end
  end
end
