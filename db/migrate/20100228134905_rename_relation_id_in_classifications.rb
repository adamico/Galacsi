class RenameRelationIdInClassifications < ActiveRecord::Migration
  def self.up
    change_table :classifications do |t| 
      t.rename :relation_id, :classe_therapeutique_id
    end
  end

  def self.down
    change_table :classifications do |t| 
      t.rename :classe_therapeutique_id, :relation_id
    end
  end
end
