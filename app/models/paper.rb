class Paper < ActiveRecord::Base
  belongs_to :project

  attr_accessor :title
  mount_uploader :file, PaperUploader
  
  validates :name, :presence => true, :uniqueness => {:scope => :project_id}
  validates :file, :presence => true
end
