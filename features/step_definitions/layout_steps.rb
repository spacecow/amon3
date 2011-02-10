Then /^I should see (?:a|an) "([^"]*)" section$/ do |section|
  page.should have_css("div##{section.downcase.gsub(/\s/,'_')}")
end

Then /^I should see no "([^"]*)" section$/ do |section|
  page.should have_no_css("div##{section.downcase.gsub(/\s/,'_')}")
end

Then /^I should see "([^"]*)" as (\w+) flash message$/ do |txt,cat|
  with_scope("div#flash_#{cat}"){ page.text.should eq txt }
end

Then /^I should see no "([^"]*)" as (\w+) flash message$/ do |txt,cat|
  page.should have_no_css("div#flash_#{cat}")
end

Then /^I should see "([^"]*)" as title$/ do |txt|
  with_scope("h1"){ page.text.should eq txt }
end

When /^I follow "([^"]*)" at the bottom of the page$/ do |link|
  When %(I follow "#{link}" within "div#bottom_links")
end

Then /^I should see (?:a|an) "([^"]*)" link at the bottom of the page$/ do |txt|
  page.should have_css("#{bottom_links_section} a", :text => txt)
end
Then /^I should see no "([^"]*)" link at the bottom of the page$/ do |txt|
  page.should have_no_css("#{bottom_links_section} a", :text => txt)
end

Then /^I should see no links at the bottom of the page$/ do
  page.should have_no_css("#{bottom_links_section} a")
end

Then /^I should see a (pdf|chm) image within the (\w+) subsection$/ do |ext,sect|
  Then %(I should see a #{ext} image within "##{sect} img")
end
Then /^I should see no (pdf|chm) image within the (\w+) subsection$/ do |ext,sect|
  page.should have_no_css("##{sect} img")
end

Then /^I should see a (pdf|chm) image within "([^"]*)"$/ do |ext,scp|
  with_scope(scp) do
    page.native.attributes["src"].value.should match("#{ext}.jpeg")
  end
end

def bottom_links_section; "div#bottom_links" end
