class PicturesController < ApplicationController
  load_and_authorize_resource
  before_filter :load_projects
  
  def destroy
    @picture.destroy
    redirect_to @project
  end

  private
    def load_projects; @project = Project.find(params[:project_id]) end
end
