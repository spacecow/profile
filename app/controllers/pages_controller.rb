class PagesController < ApplicationController
  before_filter :load_project, :only => [:new,:create,:edit,:update,:show]

  def index
    @project = Project.find(params[:project_id])    
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    @project.pages << @page
    if @project.save
      flash[:notice] = "Successfully created page."
      redirect_to project_pages_path(@project)
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page.sections.build
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to project_pages_path(@project)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    redirect_to pages_url
  end

  private

    def load_project
      @project = Project.find(params[:project_id])
    end

end
