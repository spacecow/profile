require 'spec_helper'

describe PapersController do

  describe "GET 'download'" do
    it "should be successful" do
      get 'download'
      response.should be_success
    end
  end

end
