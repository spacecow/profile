class PagesController < ApplicationController
  load_and_authorize_resource
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
      redirect_to [@project,@page]
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to [@project,@page]
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    redirect_to project_pages_path(@project)
  end

  private

    def load_project
      @project = Project.find(params[:project_id])
    end

end
