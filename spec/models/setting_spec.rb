require File.dirname(__FILE__) + '/../spec_helper'

describe Setting do
  it "should be valid" do
    Setting.new.should be_valid
  end
end
