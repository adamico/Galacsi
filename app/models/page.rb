class Page < ActiveRecord::Base
  attr_accessible :permalink, :title, :content

  def title_or_permalink
    title.nil? ? permalink : title
  end

  def self.without_home
    if Page.exists?(:permalink => 'home')
      all.reject {|page| page.permalink == 'home'}
    end
  end
end
