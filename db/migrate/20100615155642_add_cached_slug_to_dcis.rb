class AddCachedSlugToDcis < ActiveRecord::Migration
  def self.up
    add_column :dcis, :cached_slug, :string
    add_index  :dcis, :cached_slug
  end

  def self.down
    remove_index :dcis, :column => :cached_slug
    remove_column :dcis, :cached_slug
  end
end
