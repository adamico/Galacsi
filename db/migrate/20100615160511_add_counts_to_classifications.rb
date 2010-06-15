class AddCountsToClassifications < ActiveRecord::Migration
  def self.up
    add_column :classe_therapeutiques, :dcis_count, :integer, :default => 0
    add_column :dcis, :classe_therapeutiques_count, :integer, :default => 0
    ClasseTherapeutique.reset_column_information
    ClasseTherapeutique.all.each do |ct|
      ClasseTherapeutique.update_counters ct.id, :dcis_count => ct.dcis.length
    end
    Dci.reset_column_information
    Dci.all.each do |dci|
      Dci.update_counters dci.id, :classe_therapeutiques_count => dci.classe_therapeutiques.length
    end
  end

  def self.down
    remove_column :classe_therapeutiques, :dcis_count
    remove_column :dcis, :classe_therapeutiques_count
  end
end
