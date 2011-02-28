module ApplicationHelper
  def link_to_add_fields(name, f, association, new_object)
 #   new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(new_object.class.to_s.underscore.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')")
  end
  def subtitle(page_subtitle, show_subtitle = true)
    content_for(:subtitle){ page_subtitle.to_s }
    @show_subtitle = show_subtitle
  end

  def picture_link(lnk)
    "<a class='thumbnail' href='' data-url='#{Picture.find_by_name(lnk).image_url(:thumb)}'>#{lnk}</a>"
  end

  def add(s); t2(:add,s) end
  def chain(s1,s2); "#{s1.to_s}.#{s2.to_s}" end
  def lbl(s); chain(:label,s) end
  def remove(s); t2(:remove,s) end
  def t2(s1,s2); t(lbl(s1), :obj => t(s2)) end  

  private

    def section_template(obj); "#{obj.class.to_s.underscore}_fields" end
    def show_subtitle?; @show_subtitle end
    def show_template(obj); "sections/#{obj.class.to_s.underscore}"  end
end
