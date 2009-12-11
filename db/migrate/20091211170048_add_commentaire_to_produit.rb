class AddCommentaireToProduit < ActiveRecord::Migration
  def self.up
    add_column :produits, :commentaire, :text
  end

  def self.down
    remove_column :produits, :commentaire
  end
end
