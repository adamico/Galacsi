class CreateFichesSourcesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :fiches_sources, :id => false do |t|
      t.integer :fiche_id
      t.integer :source_id
    end
  end

  def self.down
    drop_table :fiches_sources
  end
end
