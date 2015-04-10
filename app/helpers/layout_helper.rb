module LayoutHelper
  def title(page_title, subtitle = nil)
    content_for(:title) { page_title.to_s }
    content_for(:subtitle) { subtitle } if subtitle
  end
end
