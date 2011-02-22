class Section < ActiveRecord::Base
  belongs_to :page
  has_many :subsections, :dependent => :destroy
  accepts_nested_attributes_for :subsections, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true
  
  attr_accessible :title, :subtitle, :type, :subsections_attributes

  validates :title, :presence => true
  validates :page_id, :presence => true
end
