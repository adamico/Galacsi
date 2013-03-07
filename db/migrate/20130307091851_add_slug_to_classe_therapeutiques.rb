class AddSlugToClasseTherapeutiques < ActiveRecord::Migration
  def change
    add_column :classe_therapeutiques, :slug, :string
    add_index :classe_therapeutiques, :slug
    ClasseTherapeutique.reset_column_information
    ClasseTherapeutique.all.each {|ct| ct.save}
  end
end
