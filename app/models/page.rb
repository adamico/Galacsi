class Page < ActiveRecord::Base
  def title_or_permalink
    title.nil? ? permalink : title
  end

  def self.without_home
    return unless exists?(permalink: 'home')
    all.reject {|page| page.permalink == 'home'}
  end

  def to_s
    title_or_permalink
  end
end
