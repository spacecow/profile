Factory.define :page do |f|
  f.name "Default page name"
end

Factory.define :picture do |f|
  f.name "Default picture name"
end

Factory.define :project do |f|
  f.sequence(:name){|n| "Default project name #{n}"}  
end

Factory.define :section do |f|
end

Factory.define :subsection do |f|
end
