class AddDistinctionRelToFiches < ActiveRecord::Migration
  def self.up
    change_table :fiches do |t|
      t.integer :distinction_id
    end
  end

  def self.down
    change_table :fiches do |t|
      t.remove :distinction_id
    end
  end
end
