class CreateSpecialites < ActiveRecord::Migration
  def self.up
    create_table :specialites do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :specialites
  end
end
