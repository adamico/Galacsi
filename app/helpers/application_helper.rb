module ApplicationHelper
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
