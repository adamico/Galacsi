class AddSlugToSpecialites < ActiveRecord::Migration
  def change
    add_column :specialites, :slug, :string
    add_index :specialites, :slug, unique: true
  end
end
