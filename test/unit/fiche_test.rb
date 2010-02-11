require "test_helper"

class FicheTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

