class Section < ActiveRecord::Base
  belongs_to :page
  has_many :subsections, :dependent => :destroy
  accepts_nested_attributes_for :subsections, :allow_destroy => true

  mount_uploader :image, ImageUploader
  
  attr_accessible :title, :subtitle, :type, :subsections_attributes, :image

  validates :page_id, :presence => true
end
