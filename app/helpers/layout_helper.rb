module LayoutHelper
  def title(page_title, subtitle = nil)
    content_for(:title) { page_title.to_s }
    content_for(:subtitle) { subtitle } if subtitle
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
