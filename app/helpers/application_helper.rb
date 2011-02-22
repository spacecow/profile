module ApplicationHelper
  def link_to_add_fields(name, f, association, new_object)
 #   new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(new_object.class.to_s.underscore.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')")
  end

  def add(s); t2(:add,s) end
  def chain(s1,s2); "#{s1.to_s}.#{s2.to_s}" end
  def lbl(s); chain(:label,s) end
  def t2(s1,s2); t(lbl(s1), :obj => t(s2)) end  
end
