module FichesHelper
  require 'active_support'
  def fiche_header(fiche)
    result = ActiveSupport::SafeBuffer.new
    if fiche.distinction_id?
      result << content_tag(:div,
        content_tag(:strong, fiche.distinction.name.humanize) +
        content_tag(:span, " : #{fiche.distinction_name.humanize}",
                    class: 'distinction'))
    end
    unless fiche.decision.blank?
      result << content_tag(:div,
         content_tag(:strong, 'Décision allaitement : ') +
         content_tag(:span, fiche.decision_name,
                     class: 'decision', id: fiche.decision_abbr))
    end
    if fiche.de_choix?
      result << content_tag(:p,
        content_tag(:span, "Molécule de choix pendant l'allaitement", class: 'safe'))
    end
    content_tag :div, result, class: 'panel-heading'
  end

  def unfructuous_search
    pars = params[:q].delete_if {|k, v| v.blank?}
    pars = pars.to_a
    string = []
    pars.each do |item|
      string << [item[1], item[0].gsub(/_like/, "")]
    end
    haml_tag :h3 do
      haml_concat "Aucun résultat pour"
      haml_concat "'#{string[0][0]}'"
      haml_concat "dans les noms de"

      field = case string[0][1]
      when /specialite/; "spécialité"
      else
        "DCI"
      end

      haml_concat field
      stripped_field = ActiveSupport::Multibyte::Chars.new field
      stripped_field = stripped_field.normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s

      haml_tag :br do end;
      if string[0][0].length > 3
        haml_concat link_to "Demander la création", new_demande_path(
          nil,
          :nom_demande => string[0][0],
          :type_demande => stripped_field)
      end
    end
    haml_tag 'div.clear' do end;
  end
end
