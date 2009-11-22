require File.dirname(__FILE__) + '/../spec_helper'

describe Produit do
  it "should be valid" do
    Produit.new.should be_valid
  end
end
