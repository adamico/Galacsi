module ProduitsHelper
  def validation
    if has_role? :guest
      if @produit.validation_date.blank?
        return ''
      else
        html = "<p><small>(Informations validées il y a <em>" +
        time_ago_in_words(@produit.validation_date) +
        "</em>)</small></p>"
      end
      html
    else
      html = "<p><strong>Validation : </strong>" +
        @produit.state.humanize
      html << " (MAJ le " + l(@produit.validation_date) + ")" if @produit.state == "valide"
      html << "</p>"
      html
    end
  end

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
