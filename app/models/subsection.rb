class Subsection < ActiveRecord::Base
  belongs_to :section

  attr_accessible :content, :type
end
