class CreateDistinctions < ActiveRecord::Migration
  def self.up
    create_table :distinctions do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :distinctions
  end
end
