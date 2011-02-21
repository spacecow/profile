Then /^I should see (?:a|an) (\w+) (\w+) error "([^"]*)"$/ do |mdl,attr,txt|
  page.should have_css("li##{mdl}_#{attr}_input p.inline-errors", :text => txt)
end
