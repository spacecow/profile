class SectionsController < ApplicationController
  before_filter :load_project, :load_page, :only => [:index,:new,:create,:show]

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(params[:section])
    @page.sections << @section
    if @page.save
      flash[:notice] = "Successfully created section."
      redirect_to project_page_sections_path(@project,@page)
    else
      render :action => 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      flash[:notice] = "Successfully updated section."
      redirect_to section_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Successfully destroyed section."
    redirect_to sections_url
  end

  private

    def load_project
      @project = Project.find(params[:project_id])
    end
    def load_page
      @page = @project.pages.find(params[:page_id])
    end

end
