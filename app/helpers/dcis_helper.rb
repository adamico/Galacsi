module DcisHelper
  def links_to_associations(dci, association)
    if dci.send(association).any?
      links = []
      dci.send(association).each do |item|
        links << link_to(h(item.name.humanize), polymorphic_path(item))
      end
      haml_concat links.join(', ').html_safe
    end
    haml_tag 'div.clear' do end;
  end
end
