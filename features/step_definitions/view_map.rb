require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given('I go to the default map page') do
  visit "/map"
end

Then('I should see a map with my current location at the center') do
  url = URI.parse(current_url).path
  expectedUrl = "/map/@1.3423256,103.9644061"
  expect(url == expectedUrl)

end

Given('I am currently on the map page') do
  visit "/map"
end

When ('I enter the location with SUTD on the default map page') do
    sleep(3)
    find("input").fill_in with: "SUTD"
    sleep(1)
end


Then ('I should see the address of SUTD inside the field on the default map page') do
    find(:xpath, "//input[@value='SUTD']")
end

Then('I should see a map with the new location at the center') do
  expectedUrl = "/map/@1.342119,103.9641467"
  url = URI.parse(current_url).path
  expect(url == expectedUrl)
end

Given('I am currently on the place information page of SUTD') do
  visit "/map/place/@1.34199,103.963665,34"
end


Then('I should see more and more reviews about the potential dangers at the location') do
  expect(page.all('.review-component-container').count).to be > 5
end

When('I look at the first report on the place information page') do
  element = find('.review-component-container', match: :first)
end

Then('I should see the user name of the user who reports.') do
    expect(page).to have_content("Anonymous User")
end

Then('I should see the correct content of the user’s reports displayed') do
    expect(page).to have_content("Everthing returns back to normal now. But please keep caution!")
end

Given ('I try to access the place information page of Changi City Point which has been reported by others') do
    visit "/map/place/@1.334273,103.962739,27"
end

Then('I should be redirected to its place information page successfully') do
  expect(page).to have_content("Changi Business Park Central 1")
end
