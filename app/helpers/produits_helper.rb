module ProduitsHelper
  def validation
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
      end
    end
  end

  #TODO refactor validate_actions for haml
  def validate_actions
    if @produit.state == "brouillon" && permitted_to?(:initialiser)
      html = "<p>"
      html << link_to("Initialiser", initialiser_produit_path(@produit), :method => :put)
      html << "</p>"
      html
    elsif (@produit.state == "a_valider" || @produit.state == "en_attente") && permitted_to?(:valider, @produit)
      html = "<p>"
      html << link_to("Valider", valider_produit_path(@produit), :method => :put)
      html << "</p>"
      html
    elsif @produit.state == "valide" && permitted_to?(:invalider, @produit)
      html = "<p>"
      html << link_to("Mettre à jour", maj_date_produit_path(@produit), :method => :put) unless @produit.validation_date == Time.now.to_date
      html << "</p>"
      html << "<p>"
      html << link_to("Invalider", invalider_produit_path(@produit), :method => :put)
      html << "</p>"
      html
    end
  end
end
