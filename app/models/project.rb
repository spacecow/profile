class Project < ActiveRecord::Base
  has_many :pages
  
  attr_accessible :name

  validates :name, :presence => true, :uniqueness => true
end
