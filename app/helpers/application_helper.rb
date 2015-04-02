# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
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

  def actions_buttons(object, klass_name = nil, labels = true, &block)
    klass_name = object.class.name unless klass_name
    result = []
    result << link_to(icon_and_label('destroy', klass_name, labels),
                      polymorphic_path(object),
                      'data-confirm': t('confirm'), method: :delete,
                      class: 'btn btn-sm btn-default') if can? :destroy, object
    result << link_to(icon_and_label('edit', klass_name, labels),
                      edit_polymorphic_path(object),
                      class: 'btn btn-sm btn-default') if can? :update, object
    result << capture(&block) if block_given?
    result.join("\n").html_safe
  end

  private

  def icon_and_label(action, klass_name, labels)
    result = []
    result << fa_icon(icon_for(action))
    result << t(action, model: klass_name) if labels
    result.join("\n").html_safe
  end

  def icon_for(action)
    case action
    when 'destroy'
      'trash-o'
    else
      'pencil'
    end
  end
end
