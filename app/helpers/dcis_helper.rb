module DcisHelper
  def links_to_associations(dci, association)
    if dci.send(association).any?
      links = []
      dci.send(association).each do |item|
        links << link_to(item.name.humanize, polymorphic_path(item))
      end
      links.join(', ').html_safe
    end
  end
end
