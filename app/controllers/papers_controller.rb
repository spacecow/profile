class PapersController < ApplicationController
  load_and_authorize_resource
  before_filter :load_projects
  
  def download
    if @paper.authenticate(params[:password])
      if @paper.file.url && File.exist?(path = @paper.file.url)
        send_file path, :content_type => "application/#{@paper.extension}",
        :filename => @paper.file.filename
      else
        flash[:alert] = alertify(:file_does_not_exist)
        redirect_to password_project_paper_path(@project,@paper, :title => params[:title])
      end
    else
      flash[:alert] = alertify(:invalid_password)
      redirect_to password_project_paper_path(@project,@paper, :title => params[:title])
    end
  end
  
  def password
    @paper.title = params[:title]
  end

  def destroy
    @paper.destroy
    redirect_to @project
  end
  
  private
    def load_projects; @project = Project.find_by_name(params[:project_id]) end
end
