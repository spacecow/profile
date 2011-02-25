class Subsection < ActiveRecord::Base
  belongs_to :section

  attr_accessible :type, :content, :col1, :col2, :col3
  
  def col1; content && content.split('#')[0] end
  def col2; content && content.split('#')[1] end
  def col3; content && content.split('#')[2] end

  def col1=(s); self.content = s end
  def col2=(s); self.content += "##{s}" end
  def col3=(s); self.content += "##{s}" end
end
