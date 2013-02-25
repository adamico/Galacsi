class AddSlugToDcis < ActiveRecord::Migration
  def change
    add_column :dcis, :slug, :string
    add_index :dcis, :slug
    remove_column :dcis, :cached_slug
  end
end
