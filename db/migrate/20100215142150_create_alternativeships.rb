class CreateAlternativeships < ActiveRecord::Migration
  def self.up
    create_table :alternativeships do |t|
      t.integer :fiche_id
      t.integer :alternative_id

      t.timestamps
    end
  end

  def self.down
    drop_table :alternativeships
  end
end
