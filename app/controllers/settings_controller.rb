class SettingsController < ApplicationController
  load_and_authorize_resource

  def index
    @settings = Setting.all
  end

  def show
    @setting = Setting.find(params[:id])
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(params[:setting])
    if @setting.save
      redirect_to @setting, :notice => created(:setting)
    else
      render :action => 'new'
    end
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(params[:setting])
      redirect_to @setting, :notice  => updated(:setting)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy
    redirect_to settings_url, :notice => deleted(:setting)
  end
end
