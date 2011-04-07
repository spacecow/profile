Factory.define :page do |f|
  f.name "Default page name"
end

Factory.define :paper do |f|
  f.name "Default paper name"
  p PaperUploader.new("features/grid.pdf")
  f.file "hej"
end

Factory.define :picture do |f|
  f.name "Default picture name"
end

Factory.define :project do |f|
  f.sequence(:name){|n| "Default project name #{n}"}
  f.sequence(:title){|n| "Default project title #{n}"}
  f.sequence(:subtitle){|n| "Default project subtitle #{n}"}
end

Factory.define :section do |f|
end

Factory.define :subsection do |f|
end

Factory.define :user do |f|
  f.sequence(:username){|n| "username#{n}"}
  f.sequence(:email){|n| "default#{n}@email.com"}
  f.password "abc123"
end
