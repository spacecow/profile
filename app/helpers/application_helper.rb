module ApplicationHelper
  def clean(s)
    if s.match(/\|/)
      raw s.gsub(/<.+?>/,'').
        gsub(/(\S+)\|(\w+)=(\w+)/){ $2=="img" ? picture_link($1,$3) : pdf_link($1,$3)}.
        split("\r\n").join("<br />")
    else
      raw s.gsub(/<.+?>/,'').
        split("\r\n").join("<br />")
    end
  end
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

  def picture_link(name,lnk)
    picture = Picture.find_by_name(lnk)
    if picture
      "<a class='thumbnail' href='#{picture.image_url}' data-url='#{picture.image_url(:thumb)}'>#{name}</a>"
    else
      lnk
    end
  end

  def pdf_link(name,lnk)
    paper = Paper.find_by_name(lnk)
    if paper
      link_to(name, download_project_paper_path(paper))
    else
      lnk
    end
  end

  def add(s); t2(:add,s) end
  def chain(s1,s2); "#{s1.to_s}.#{s2.to_s}" end
  def current_language; english? ? t(:japanese) : t(:english) end
  def edit(s); t2(:edit,s) end
  def edit_p(s); tp2(:edit,s) end
  def ft(s); t("formtastic.labels.#{s.to_s}") end
  def lbl(s); chain(:label,s) end
  def pl(s); t(s).match(/\w/) ? t(s).pluralize : t(s) end
  def remove(s); t2(:remove,s) end
  def sure?; t('message.sure?') end
  def t2(s1,s2); t(lbl(s1), :obj => t(s2)) end  
  def tp2(s1,s2); t(lbl(s1), :obj => pl(s2)) end
  def update(s); t2(:update,s) end
  def update_p(s); tp2(:update,s) end
  
  private

    def section_template(obj); "#{obj.class.to_s.underscore}_fields" end
    def show_subtitle?; @show_subtitle end
    def show_template(obj); "sections/#{obj.class.to_s.underscore}"  end
end
