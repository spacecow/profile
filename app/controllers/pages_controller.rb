class PagesController < ApplicationController
  before_filter :load_project
  before_filter :load_page, :only => [:show,:edit,:update,:destroy]
  load_and_authorize_resource

  def index
    @pages = @project.pages
  end

  def show
  end

  def new
  end

  def create
    @project.pages << @page
    if @project.save
      flash[:notice] = "Successfully created page."
      redirect_to [@project,@page]
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to [@project,@page]
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    redirect_to project_pages_path(@project)
  end

  private

    def load_project; @project = Project.find_by_name(params[:project_id]) end
    def load_page; @page = @project.pages.find_by_name(params[:id]) end 
end
