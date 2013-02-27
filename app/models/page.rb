class Page < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :title, :slug, :content

  friendly_id :title, use: :slugged

  def self.without_home
    if Page.find('bienvenue')
      find(:all).reject {|page| page.slug == 'bienvenue'}
    end
  end
end
