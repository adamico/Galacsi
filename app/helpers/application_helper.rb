# encoding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction_class = sort_direction == "asc" ? "icon-arrow-up" : "icon-arrow-down"
    css_class = column == sort_column ? "current" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to (title + " " + content_tag(:i, nil, class: direction_class)).html_safe, {sort: column, direction: direction}, {class: css_class}
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
end
