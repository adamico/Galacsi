class AddSlugToClasseTherapeutiques < ActiveRecord::Migration
  def change
    add_column :classe_therapeutiques, :slug, :string
    add_index :classe_therapeutiques, :slug, unique: true
  end
end
