class RenameDistinctionInFiches < ActiveRecord::Migration
  def self.up
    change_table :fiches do |t|
      t.rename :distinction, :distinction_name
    end
  end

  def self.down
    change_table :fiches do |t|
      t.rename :distinction_name, :distinction
    end
  end
end
