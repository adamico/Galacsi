# == Schema Information
#
# Table name: produits
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  state           :string(255)
#  decision_id     :integer
#  validation_date :date
#  commentaire     :text
#

require File.dirname(__FILE__) + '/../spec_helper'

describe Produit do
  it "should be valid" do
    Produit.new.should be_valid
  end
end

