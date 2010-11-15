# encoding: utf-8
module FichesHelper
  def fiche_header(fiche)
    haml_tag :div, :class => "fiche_header" do
      if fiche.distinction_id?
        haml_tag :p, :class => "float_left" do
          haml_tag :span, fiche.distinction.name.humanize,
            :<, :class => "strong"
          haml_tag :span, " : #{fiche.distinction_name.humanize}",
            :<, :class => "distinction"
        end
      end
      unless fiche.decision.blank?
        haml_tag :p, :class => "float_right" do
          haml_tag :span, "Décision allaitement : ",
            :<, :class => "strong"
          haml_tag :span, h(fiche.decision.name),
            :<, {:class => "decision", :id => "#{fiche.decision.abbr}"}
        end
      end
      haml_tag :div, :class => "clear"
      if fiche.de_choix?
        haml_tag :p do
          haml_tag :span, {:class => "safe"} do
            haml_concat "Molécule de choix pendant l'allaitement"
          end
        end
      end
    end
  end
end
