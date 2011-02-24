class Project < ActiveRecord::Base
  has_many :pages
  has_many :pictures
  accepts_nested_attributes_for :pictures, :allow_destroy => true
    
  attr_accessible :name, :title, :subtitle, :pictures_attributes

  validates :name, :presence => true, :uniqueness => true
end
