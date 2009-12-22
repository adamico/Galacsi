# encoding: utf-8
class CreateDecisions < ActiveRecord::Migration
  def self.up
    create_table :decisions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    decision_names = ["Contre-indiqué", "A discuter", "Compatible", "Compatible 2e intention"]
    decision_names.each do |name|
      Decision.create(:name => name)
    end
  end

  def self.down
    drop_table :decisions
  end
end
