#encoding: utf-8
module DcisHelper

  def links_to_associations(dci, association)
    unless dci.send(association).empty?
      haml_tag :h2 do
        title = case association
                when "specialites" then "Spécialités : "
                when "classe_therapeutiques" then "Classes thérapeutiques : "
                end
        haml_concat title
        links = []
        dci.send(association).each do |item|
          links << link_to(h(item.name.humanize), polymorphic_path(item))
        end
        haml_concat links.join(', ')
      end
    end
    haml_tag 'div.clear' do end;
  end

  def search_result
    pars = params[:search].delete_if {|k, v| v.blank?}
    pars = pars.to_a
    string = []
    pars.each do |item|
      string << [item[1], item[0].gsub(/_like/, "")]
    end
    haml_tag :h3 do
      haml_concat "Aucun résultat pour"
      haml_concat "\"#{string[0][0]}\""
      haml_concat "dans les noms de"

      field = case string[0][1]
      when /classe/; "CLASSE THERAPEUTIQUE"
      when /specialite/; "SPECIALITÉ"
      else
        "DCI"
      end

      haml_concat field
      haml_tag :br do end;
      if string[0][0].length > 3
        haml_concat link_to "Demander la création", new_demande_path(
          nil,
          :nom_demande => string[0][0],
          :type_demande => field)
      end
    end
  end
end
