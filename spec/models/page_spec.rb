require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  before(:each) do
    @project = Factory(:project)
  end
  it "pages in the same project cannot have the same position" do
    @page = Page.new(:name => "page")
    @page2 = Page.new(:name => "page2")
    @page2.pos = @page.pos
    @project.pages << @page
    @project.pages << @page2
    @page.should be_valid
    @page2.should_not be_valid
  end

  it "pages in different projects can have the same position" do
    @project2 = Factory(:project)
    @page = Page.new(:name => "page")
    @page2 = Page.new(:name => "page2")
    @page2.pos = @page.pos
    @project.pages << @page
    @project2.pages << @page2
    @page.should be_valid
    @page2.should be_valid
  end

  describe "the last position" do
    before(:each) do
      @c = PagesController.new
    end
    it "should be -1 if there are no pages" do
      @c.send("last_pos").should eq -1
    end
    it "should be equal to the last page's pos" do
      proj = Factory(:project)
      page1 = Factory(:page, :project_id => proj.id, :pos => 1)
      page2 = Factory(:page, :project_id => proj.id, :pos => 2)
      @c.send("last_pos").should eq page2.pos
    end
  end
end
