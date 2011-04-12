class ProjectsController < ApplicationController
  before_filter :load_project, :only => [:show,:edit,:update,:destroy]
  load_and_authorize_resource
  
  def index
    @projects = Project.all
  end

  def show
    @pages = @project.pages
    redirect_to [@project,@pages.first] if cannot? :admin, @project
  end

  def new
  end

  def create
    if @project.save
      flash[:notice] = "Successfully created project."
      redirect_to @project
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Successfully updated project."
      redirect_to projects_url
    else
      #redirect_to edit_project_path(@project)
      render :action => 'edit'
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Successfully destroyed project."
    redirect_to projects_url
  end

  def admin;  end
  
  private
    def load_project; @project = Project.find_by_name(params[:id]) end
end
