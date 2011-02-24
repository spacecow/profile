class Section < ActiveRecord::Base
  belongs_to :page
  has_many :subsections, :dependent => :destroy
  accepts_nested_attributes_for :subsections, :allow_destroy => true

  attr_accessible :title, :subtitle, :type, :subsections_attributes

  validates :page_id, :presence => true
end
