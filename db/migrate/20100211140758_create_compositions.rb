class CreateCompositions < ActiveRecord::Migration
  def self.up
    create_table :compositions do |t|
      t.integer :dci_id
      t.integer :specialite_id

      t.timestamps
    end
  end

  def self.down
    drop_table :compositions
  end
end
