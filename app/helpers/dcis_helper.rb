#encoding: utf-8
module DcisHelper
  def links_to_associations(dci, association)
    unless dci.send(association).empty?
      links = []
      dci.send(association).each do |item|
        links << link_to(h(item.name.humanize), polymorphic_path(item))
      end
      haml_concat links.join(', ')
    end
    haml_tag 'div.clear' do end;
  end
end
