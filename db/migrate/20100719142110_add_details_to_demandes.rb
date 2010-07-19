class AddDetailsToDemandes < ActiveRecord::Migration
  def self.up
    add_column :demandes, :contexte, :text
    add_column :demandes, :demandeur, :string
  end

  def self.down
    remove_column :demandes, :demandeur
    remove_column :demandes, :contexte
  end
end
