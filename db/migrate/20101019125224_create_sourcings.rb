class CreateSourcings < ActiveRecord::Migration
  def self.up
    create_table :sourcings do |t|
      t.references :fiche
      t.references :source

      t.timestamps
    end
  end

  def self.down
    drop_table :sourcings
  end
end
