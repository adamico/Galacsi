class AddArticlesToFiches < ActiveRecord::Migration
  def self.up
    add_column :fiches, :articles, :text
  end

  def self.down
    remove_column :fiches, :articles
  end
end
