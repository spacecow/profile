class PicturesController < ApplicationController
  before_filter :load_projects
  load_and_authorize_resource
  
  def destroy
    @picture.destroy
    redirect_to @project
  end

  private
    def load_projects; @project = Project.find_by_name(params[:project_id]) end
end
