Then /^I should see (?:a|an) (\w+) (\w+) error "([^"]*)"$/ do |mdl,attr,txt|
  with_scope("li##{mdl}_#{attr}_input p.inline-errors"){ page.text.should eq txt }
end

Then /^I should see no (\w+) (\w+) error "([^"]*)"$/ do |mdl,attr,txt|
  page.should have_no_css("li##{mdl}_#{attr}_input p.inline-errors", :text => txt)
end
