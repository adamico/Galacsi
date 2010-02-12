class CreateDemandes < ActiveRecord::Migration
  def self.up
    create_table :demandes do |t|
      t.string :type
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :demandes
  end
end
