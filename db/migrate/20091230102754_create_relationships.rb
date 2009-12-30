class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :produit_id
      t.integer :relation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
