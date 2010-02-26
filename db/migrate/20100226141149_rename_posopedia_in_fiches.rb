class RenamePosopediaInFiches < ActiveRecord::Migration
  def self.up
    change_table :fiches do |t|
      t.rename :poso_pedia, :has_poso_pedia
      t.string :poso_pedia_dose
    end
  end

  def self.down
    change_table :fiches do |t|
      t.rename :has_poso_pedia, :poso_pedia
      t.remove :poso_pedia_dose
    end
  end
end
