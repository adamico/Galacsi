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
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

  def link_to_toggle_div(name, id)
    link_to_function(name, h("toggle_div(\"##{id}\")"))
  end

  def actions_buttons(object)
    haml_tag('ul.actions.inline') do
      if can? :show, object and [Fiche, Demande].include?(object.class)
        path = case object.class
               when Fiche; [object.dci, object]
               else object;
               end
        haml_tag :li do
          haml_concat(button_to("Voir", polymorphic_path(path),
                                :method => :get,
                                :class => "go_button"))
        end
      end
      if can? :update, object
        haml_tag :li do
          haml_concat(button_to("Modifier", edit_polymorphic_path(object), :method => :get, :class => "edit_button"))
        end
      end
      if can? :destroy, object
        haml_tag :li do
          haml_concat(button_to("Détruire", polymorphic_path(object), :confirm => 'Etes-vous sûr ?', :method => :delete, :class => "destroy_button"))
        end
      end
    end
    haml_tag('div.clear_both') do
    end
  end

end
