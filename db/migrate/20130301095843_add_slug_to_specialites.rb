class AddSlugToSpecialites < ActiveRecord::Migration
  def change
    add_column :specialites, :slug, :string
    add_index :specialites, :slug
    Specialite.reset_column_information
    Specialite.all.each {|s| s.save}
  end
end
