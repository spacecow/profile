class Page < ActiveRecord::Base
  belongs_to :project
  has_many :sections
  accepts_nested_attributes_for :sections, :reject_if => lambda {|a| a[:title].blank?}, :allow_destroy => true
  
  attr_accessible :name, :sections_attributes

  validates :project_id, :presence => true
  validates :name, :presence => true, :uniqueness => {:scope => :project_id}
end
