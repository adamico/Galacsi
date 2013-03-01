# encoding: utf-8
module FichesHelper
  require 'active_support'
  def fiche_header(fiche)
    haml_tag :div, :class => "fiche_header" do
      if fiche.distinction_id?
        haml_tag :p, :class => "pull-left" do
          haml_tag :span, fiche.distinction.name.humanize,
            :<, :class => "strong"
          haml_tag :span, " : #{fiche.distinction_name.humanize}",
            :<, :class => "distinction"
        end
      end
      unless fiche.decision.blank?
        haml_tag :p, :class => "pull-right" do
          haml_tag :span, "Décision allaitement : ",
            :<, :class => "strong"
          haml_tag :span, h(fiche.decision_name),
            :<, {:class => "decision #{fiche.decision_abbr}"}
        end
      end
      haml_tag :div, :class => "clear"
      if fiche.de_choix?
        haml_tag :p do
          haml_tag :span, {:class => "safe"} do
            haml_concat "Molécule de choix pendant l'allaitement"
          end
        end
      end
    end
  end

  def unfructuous_search
    pars = params[:q].delete_if {|k, v| v.blank?}
    pars = pars.to_a
    string = []
    pars.each do |item|
      string << [item[1], item[0].gsub(/_like/, "")]
    end

    h3_content = "Aucun résultat pour '#{string[0][0]}' dans les noms de "

    field = case string[0][1]
    when /specialite/; "spécialité"
    else
      "DCI"
    end

    h3_content += field
    stripped_field = ActiveSupport::Multibyte::Chars.new(field).normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s
    if string[0][0].length > 3
      h3_content += "<br>"
      h3_content += link_to("Demander la création", new_demande_path(nil, nom_demande: string[0][0], type_demande: stripped_field))
    end

    content_tag :h3, h3_content.html_safe
  end
end
