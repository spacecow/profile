Then /^I should see "([^"]*)" as (\w+) flash message$/ do |txt,cat|
  with_scope("div#flash_#{cat}"){ page.text.should eq txt }
end

Then /^I should see "([^"]*)" as title$/ do |txt|
  Then %(I should see "#{txt}" within "h1")
end
