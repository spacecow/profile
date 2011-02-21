class Section < ActiveRecord::Base
  belongs_to :page

  attr_accessible :title, :subtitle, :type

  validates :title, :presence => true
  validates :page_id, :presence => true
end
