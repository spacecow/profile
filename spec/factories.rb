Factory.define :page do |f|
  f.sequence(:name){|n| "Default-page-name-#{n}"}
  f.sequence(:menu){|n| "Default-page-menu-#{n}"}
  f.sequence(:pos){|n| n}
end

Factory.define :paper do |f|
  f.name "Default-paper-name"
  #  f.file File.open('features/default.pdf')
  f.password "abc123"
end

Factory.define :picture do |f|
  f.name "Default-picture-name"
end

Factory.define :project do |f|
  f.sequence(:name){|n| "Default-project-name-#{n}"}
  f.sequence(:title){|n| "Default project title #{n}"}
  f.sequence(:subtitle){|n| "Default project subtitle #{n}"}
end

Factory.define :section do |f|
end

Factory.define :setting do
end

Factory.define :subsection do |f|
end

Factory.define :user do |f|
  f.sequence(:username){|n| "username#{n}"}
  f.sequence(:email){|n| "default#{n}@email.com"}
  f.password "abc123"
end
