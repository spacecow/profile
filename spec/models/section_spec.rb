require File.dirname(__FILE__) + '/../spec_helper'

describe Section do
  it "should be valid" do
    Section.new.should be_valid
  end
end
