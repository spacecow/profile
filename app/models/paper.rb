class Paper < ActiveRecord::Base
  belongs_to :project

  attr_accessor :title
  mount_uploader :file, PaperUploader
  
  validates :name, :presence => true, :uniqueness => {:scope => :project_id}

  def extension; file.url.split('.').last end
  def listing; "#{name} (#{file_url ? file.file.filename : ""})" end
end
