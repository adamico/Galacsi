class RemoveClasseTherapeutiquesCountFromDcis < ActiveRecord::Migration
  def self.up
    change_table :dcis do |t|
      t.remove :classe_therapeutiques_count
    end
  end

  def self.down
    change_table :dcis do |t|
      t.integer :classe_therapeutiques_count
    end
  end
end
