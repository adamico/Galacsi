class RenameTypeInSources < ActiveRecord::Migration
  def self.up
    change_table :sources do |t|
      t.rename :type, :nature
      
    end
  end

  def self.down
    change_table :sources do |t|
      t.rename :nature, :type
      
    end
  end
end
