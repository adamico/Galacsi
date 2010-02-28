class CreateClasseTherapeutiques < ActiveRecord::Migration
  def self.up
    create_table :classe_therapeutiques do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :classe_therapeutiques
  end
end
