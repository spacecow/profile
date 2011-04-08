class PapersController < ApplicationController
  load_and_authorize_resource
  
  def download
  end
  
  def password
    @project = Project.find(params[:project_id])
    @paper.title = params[:title]
  end
end
