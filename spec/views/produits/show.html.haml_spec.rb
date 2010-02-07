require "spec_helper"

describe "produits/show.html.haml" do
  it "displays produit name" do
    produit = mock_model(Produit, :name => "a_name")
    assigns[:produit] = produit
    render
    response.should contain("a_name")
  end
end