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
    picture = @project.pictures.find_by_name(lnk)
    if picture
      "<a class='thumbnail' href='#{prefixed_url(picture.image_url)}' data-url='#{prefixed_url(picture.image_url)}'>#{name}</a>"
    else
      lnk
    end
  end

  def main_setting; @main_setting ||= Setting.find_by_name("main") end
  def prefix; main_setting ? "/#{main_setting.prefix}" : "" end
  def prefixed_url(s); "#{prefix}#{s}" end
  
  def pdf_link(name,lnk)
    paper = @project.papers.find_by_name(lnk)
    if paper
      link_to(name, private_exchange(password_project_paper_path(@project,paper, :title => name)))
    else
      lnk
    end
  end

# Special routing hack
  
  def special_stylesheet_link_tag(s,h={})
    stylesheet_link_tag(s,h).gsub(/\/stylesheets/,prefixed_url("/stylesheets"))
  end
  def special_javascript_include_tag(s)
    javascript_include_tag(s).gsub(/\/javascripts/,prefixed_url("/javascripts"))
  end
  def private_path(s)
    "/#{@project.name}/pages/#{s.name}"
  end

#----------------------
  
  def add(s); t2(:label,:add,s) end
  def chain(s1,s2); "#{s1.to_s}.#{s2.to_s}" end
  def current_language; english? ? t(:japanese) : t(:english) end
  def d(s); t(s).downcase end
  def edit(s); t2(:label,:edit,s) end
  def edit_p(s); tp2(:label,:edit,s) end
  def ft(s); t("formtastic.labels.#{s.to_s}") end
  def no_dp(s); tdp2(:message,:none,s) end
  def dp(s); t(s).match(/\w/) ? d(s).pluralize : d(s) end
  def new(s); t2(:label,:new,s) end
  def pl(s); t(s).match(/\w/) ? t(s).pluralize : t(s) end
  def remove(s); t2(:remove,s) end
  def sure?; t('message.sure?') end
  def t2(lbl,s1,s2); t(chain(lbl,s1), :obj => t(s2)) end  
  def tdp2(lbl,s1,s2); t(chain(lbl,s1), :obj => dp(s2)) end
  def tp2(lbl,s1,s2); t(chain(lbl,s1), :obj => pl(s2)) end
  def update(s); t2(:update,s) end
  def update_p(s); tp2(:label,:update,s) end
  def view(s); t2(:label,:view,s) end
  
  private

    def section_template(obj); "#{obj.class.to_s.underscore}_fields" end
    def show_subtitle?; @show_subtitle end
    def show_template(obj); "sections/#{obj.class.to_s.underscore}"  end
end
