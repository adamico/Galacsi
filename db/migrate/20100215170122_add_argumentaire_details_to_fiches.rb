class AddArgumentaireDetailsToFiches < ActiveRecord::Migration
  def self.up
    change_table :fiches do |t|
      t.string :biodisponibilite, :dose_ingeree, :dose_ingeree_par_rapport, :liaison_pp, :vol_dist, :tmax, :thalf, :pm, :passage_lait, :rapport_lp
      t.boolean :poso_pedia, :metabolites_actifs, :risque_accumulation, :risque_dim_lactation
      t.string :poso_pedia_des
    end
  end

  def self.down
    change_table :fiches do |t|
      t.remove(:biodisponibilite, :dose_ingeree, :dose_ingeree_par_rapport, :liaison_pp, :vol_dist, :tmax, :thalf, :pm, :passage_lait, :rapport_lp, :poso_pedia, :metabolites_actifs, :risque_accumulation, :risque_dim_lactation, :poso_pedia_des)
    end
  end
end
