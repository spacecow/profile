class Paper < ActiveRecord::Base
  belongs_to :project

  mount_uploader :file, PaperUploader
  
  validates :name, :presence => true, :uniqueness => {:scope => :project_id}
end
