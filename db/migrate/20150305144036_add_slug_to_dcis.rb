class AddSlugToDcis < ActiveRecord::Migration
  def change
    add_column :dcis, :slug, :string
    add_index :dcis, :slug, unique: true
  end
end
