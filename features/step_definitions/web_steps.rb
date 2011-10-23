require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } :yield
  end
end
World(WithinHelpers)

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )fill in the following(?: within "([^"]*)")?(?: in the "([^"]*)" table)?:$/ do |selector, table_name, fields|
  perfix = table_name.present? ? "#{table_name}_" : ""
  with_scope(selector) do
    fields.rows_hash.each do |field, value|
      When %{I fill in "#{perfix}#{field}" with "#{value}"}
    end
  end
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, value, selector|
  with_scope(selector) do
    fill_in(field, :with => value)
  end
end

Then /^(?:|I )should see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Then /^(?:|I )should not see "([^"]*)"(?: with "([^"*])")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      asset page.has_no_content?(text)
    end
  end
end

Then /^show me the page$/ do
  save_and_open_page
end