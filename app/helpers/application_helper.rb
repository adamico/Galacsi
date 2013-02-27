# encoding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")").html_safe
  end

  def link_to_toggle_div(name, id)
    link_to_function(name, "toggle_div(\"##{id}\")").html_safe
  end

  def actions_buttons(object)
    buttons = []
    path = case object.class
           when Fiche; [object.dci, object]
           else object;
           end
    buttons.push link_to("Voir #{object.class.name}", polymorphic_path(path), class: "btn btn-success") if can? :show, object and [Fiche, Demande].include?(object.class)
    buttons.push link_to("Modifier #{object.class.name}", edit_polymorphic_path(object), class: "btn btn-warning") if can? :update, object
    buttons.push link_to("Détruire #{object.class.name}", polymorphic_path(object), confirm: 'Etes-vous sûr ?', method: :delete, class: "btn btn-danger ") if can? :destroy, object
    content = buttons.join("\n").html_safe
    content_tag :div, content, class: "btn-group"
  end

  def unfructuous_search
    pars = params[:search].delete_if {|k, v| v.blank?}
    pars = pars.to_a
    string = []
    pars.each do |item|
      string << [item[1], item[0].gsub(/_like/, "")]
    end
    haml_tag :h3 do
      haml_concat "Aucun résultat pour"
      haml_concat "'" + "#{string[0][0]}" + "'"
      haml_concat "dans les noms de"

      field = case string[0][1]
      when /specialite/; "SPECIALITE"
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
