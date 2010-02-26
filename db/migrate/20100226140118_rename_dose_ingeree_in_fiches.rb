class RenameDoseIngereeInFiches < ActiveRecord::Migration
  def self.up
    change_table :fiches do |t|
      t.rename :dose_ingeree, :dose_par_rapport_dmap
      t.rename :dose_ingeree_par_rapport, :dose_par_rapport_dp
    end
  end

  def self.down
    change_table :fiches do |t|
      t.rename :dose_par_rapport_dmap, :dose_ingeree
      t.rename :dose_par_rapport_dp, :dose_ingeree_par_rapport
    end
  end
end
