class CreateDcis < ActiveRecord::Migration
  def self.up
    create_table :dcis do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :dcis
  end
end
