class Picture < ActiveRecord::Base
  belongs_to :project

  mount_uploader :image, ImageUploader

  validates :name, :presence => true, :uniqueness => {:scope => :project_id}
end
