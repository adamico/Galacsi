class RemoveDistinctionTypeFromFiches < ActiveRecord::Migration
  def self.up
    change_table :fiches do |t|
      t.remove :distinction_type
    end
  end

  def self.down
    change_table :fiches do |t|
      t.text :distinction_type
    end
  end
end
