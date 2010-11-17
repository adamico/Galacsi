require File.dirname(__FILE__) + '/../spec_helper'

describe Source do
  let(:source) {Factory(:source)}
  subject {source}

  it {should be_valid}
  it "should require a name" do
    subject.name = ""
    subject.should_not be_valid
  end
  it "should reject invalid url sources" do
    pending("not used for now")
    urls = %w(http:/www.url.com httpp://www.url.com http://www,url.com)
    urls.each do |url|
      subject.url = url
      subject.should_not be_valid
    end
  end
end



# == Schema Information
#
# Table name: sources
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  nature     :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

