# encoding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
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
