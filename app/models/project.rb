class Project < ActiveRecord::Base
  has_many :pages
  
  attr_accessible :name, :title, :subtitle

  validates :name, :presence => true, :uniqueness => true
end
