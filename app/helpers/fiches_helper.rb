module FichesHelper
  require 'active_support'
  def fiche_header(fiche)
    result = ActiveSupport::SafeBuffer.new
    if fiche.distinction_id?
      result << content_tag(:div,
        content_tag(:strong, fiche.distinction.name.humanize) +
        content_tag(:span, " : #{fiche.distinction_name.humanize}",
                    class: 'distinction'))
    end
    unless fiche.decision.blank?
      result << content_tag(:div,
         content_tag(:strong, 'Décision allaitement : ') +
         content_tag(:span, fiche.decision_name,
                     class: 'decision', id: fiche.decision_abbr))
    end
    if fiche.de_choix?
      result << content_tag(:p,
        content_tag(:span, "Molécule de choix pendant l'allaitement", class: 'safe'))
    end
    content_tag :div, result, class: 'panel-heading'
  end

  def unfructuous_search
    pars = params[:q].delete_if {|k, v| v.blank?}
    pars = pars.to_a
    string = []
    pars.each do |item|
      string << [item[1], item[0].gsub(/_like/, "")]
    end
    haml_tag :h3 do
      haml_concat "Aucun résultat pour"
      haml_concat "'#{string[0][0]}'"
      haml_concat "dans les noms de"

      field = case string[0][1]
      when /specialite/; "spécialité"
      else
        "DCI"
      end

      haml_concat field
      stripped_field = ActiveSupport::Multibyte::Chars.new field
      stripped_field = stripped_field.normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s

      haml_tag :br do end;
      if string[0][0].length > 3
        haml_concat link_to "Demander la création", new_demande_path(
          nil,
          :nom_demande => string[0][0],
          :type_demande => stripped_field)
      end
    end
    haml_tag 'div.clear' do end;
  end

  def label_for_state(fiche)
    content_tag(:label, fiche.state.humanize,
                class: "label label-#{state_class_for(fiche)}")
  end

  def change_state_for(fiche, user)
    if (transitions = allowed_state_transitions_for(user, fiche)).any?
      form_for([fiche.dci, fiche], html: {class: 'state_form'}) do |f|
        f.label(:state_event, "=> ") +
        f.collection_select(:state_event, transitions, :event,
                            :human_to_name, {}, { style: 'display: none;'}) +
        f.submit(transitions.first.event.to_s.humanize,
                 class: 'btn btn-xs btn-default')
      end
    end
  end

  def state_class_for(fiche)
    fiche.valide? ? 'primary' : 'danger'
  end

  private

  def allowed_state_transitions_for(user, fiche)
    transitions = fiche.state_transitions
    transitions.reject! do |transition|
      [:valider, :mettre_en_attente].include?(transition.event) && user.role == 'contributeur'
    end
    transitions
  end
end
