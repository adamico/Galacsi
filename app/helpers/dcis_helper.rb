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
      when /classe/; "classe thérapeutique"
      when /specialite/; "spécialité"
      else
        "les noms de DCI"
      end
      haml_concat field
    end
  end
end
