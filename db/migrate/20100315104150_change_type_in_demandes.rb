class ChangeTypeInDemandes < ActiveRecord::Migration
  def self.up
    change_table :demandes do |t|
      t.rename :type, :nature
      
    end
  end

  def self.down
    change_table :demandes do |t|
      t.rename :nature, :type
      
    end
  end
end
