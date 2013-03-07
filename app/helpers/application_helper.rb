# encoding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction_class = sort_direction == "asc" ? "icon-arrow-up" : "icon-arrow-down"
    css_class = column == sort_column ? "current" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to (title + " " + content_tag(:i, nil, class: direction_class)).html_safe, params.merge(sort: column, direction: direction, page: nil), {class: css_class}
  end

  def link_to_toggle_div(name, id)
    link_to_function(name, "toggle_div(\"##{id}\")").html_safe
  end

  def actions_buttons(object, text=true)
    buttons = []
    path = case object.class
           when Fiche; [object.dci, object]
           else object;
           end
    show_button = link_to polymorphic_path(path), class: "btn btn-mini btn-success" do
      [
        content_tag(:i, nil, class: "icon-eye-open icon-white"),
        (text ? "Voir #{object.class.name}" : nil)
      ].compact.join(" ").html_safe
    end
    edit_button = link_to edit_polymorphic_path(object), class: "btn btn-mini btn-warning" do
      [
        content_tag(:i, nil, class: "icon-pencil icon-white"),
        (text ? "Modifier #{object.class.name}" : nil)
      ].compact.join(" ").html_safe
    end
    destroy_button = link_to polymorphic_path(object), data: {confirm: 'Etes-vous sûr ?'}, method: :delete, class: "btn btn-mini btn-danger" do
      [
        content_tag(:i, nil, class: "icon-remove icon-white"),
        (text ? "Détruire #{object.class.name}" : nil)
      ].compact.join(" ").html_safe
    end

    buttons.push show_button if can? :show, object and [Fiche, Demande].include?(object.class)
    buttons.push edit_button if can? :update, object
    buttons.push destroy_button if can? :destroy, object

    content_tag :div, buttons.join("\n").html_safe, class: "btn-group"
  end
end
