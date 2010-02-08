require "spec_helper"

describe "fiches/show.html.haml" do
  it "displays fiche name" do
    fiche = mock_model(Fiche, :name => "a_name")
    assigns[:fiche] = fiche
    render
    response.should contain("a_name")
  end
end