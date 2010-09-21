#encoding: utf-8
module DcisHelper
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
