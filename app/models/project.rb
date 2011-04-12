class Project < ActiveRecord::Base
  has_many :pages
  has_many :pictures
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  has_many :papers
  accepts_nested_attributes_for :papers, :allow_destroy => true
  
  attr_accessible :name, :title, :subtitle, :pictures_attributes, :papers_attributes

  validates :name, :presence => true, :uniqueness => true

  def to_param; name end
end
