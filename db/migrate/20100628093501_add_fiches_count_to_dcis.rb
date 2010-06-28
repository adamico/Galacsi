class AddFichesCountToDcis < ActiveRecord::Migration
  def self.up
    add_column :dcis, :fiches_count, :integer, :default => 0
    Dci.reset_column_information
    Dci.all.each do |dci|
      Dci.update_counters dci.id, :fiches_count => dci.fiches.length
    end
  end

  def self.down
    remove_column :dcis, :fiches_count
  end
end
