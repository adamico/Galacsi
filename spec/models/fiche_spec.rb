require File.dirname(__FILE__) + '/../spec_helper'

describe Fiche do
  it "should be valid" do
    Fiche.new.should be_valid
  end
end



# == Schema Information
#
# Table name: fiches
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  state            :string(255)
#  decision_id      :integer
#  validation_date  :date
#  commentaire      :text
#  distinction      :text
#  distinction_type :text
#  dci_id           :integer
#

