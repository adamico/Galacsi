class RenameProduitRefInRelationships < ActiveRecord::Migration
  def self.up
    change_table(:relationships) do |t|

      t.rename(:produit_id, :fiche_id)
    end
  end

  def self.down
    change_table(:relationships) do |t|

      t.rename(:fiche_id, :produit_id)
    end
  end
end
