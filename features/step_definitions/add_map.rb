require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given('I am at the default map page') do
  # Write code here that turns the phrase above into concrete actions
  visit "/map"
  sleep(5)
end

When('I click the REPORT DANGERS button to add a dangerous location') do
    find('button', :text => "REPORT DANGERS").click
end

Then('I should be redirected to the risk report page with a form displayed') do
  expect(page).to have_content("Risk Report")
end

Given('I am at the add the risk report page') do
  visit "/map/report/new"
end

When('I enter the location with SUTD') do
  fill_in("Location", :with => "SUTD")
  sleep(1)
end

When('I select the option containing SUTD in the autocomplete') do
  find('li', :text => 'SUTD Changi South Avenue 1, Singapore').click
end

Then('I should see the address of SUTD inside the field') do
  find(:xpath, "//input[@value='59 Changi South Ave 1, Singapore 485999']")
  # expect(page).to have_content("59 Changi South Ave 1, Singapore 485999")
end

When('I fill all the required information') do
  fill_in("Location", :with => "SUTD")
  sleep(1)
  find('li', :text => 'SUTD Changi South Avenue 1, Singapore').click
  element = find("#description")
  element.fill_in with: "Everthing returns back to normal now. But please keep caution!"
end

When('I click post button') do
  click_button("Post")
end

Then('I should get back to the default map page') do
  sleep(5)
  expect(page).to have_content('Map')
end

Then('I should be able to see a successful toast') do
  expect(page).to have_content("You have successfully submitted the report.")
end

When('I check the current location box') do
  page.find('#checkbox', visible: :all).check
end

Then('I should see the location field is auto-filled with the parsed address via GPS') do
  sleep(5)
  find(:xpath, "//input[@value='55 Changi South Ave 1, #09-20, Singapore 485997']")
end

When('I fill half of the required fields') do
  fill_in("Location", :with => "SUTD")
  sleep(1)
  find('li', :text => 'SUTD Changi South Avenue 1, Singapore').click
end

Then('I should see a red warning beside the submit button') do
    page.find('p', :text => 'Please fill in all required fields in red')
    #find('p', :text => 'Please fill in all required fields in red')
end

Then('I should see the required fields which I forget to fill are highlighted in red.') do
  color = page.find('#description').native.css_value('color')
  expect(color).to eq('rgba(0, 0, 0, 0.87)')
end

Given('I am at the place information page of SUTD') do
  visit('/map/place/@1.34199,103.963665,34')
end

When('I click the REPORT button to add a dangerous location on the place information page') do
  find('button', :text => "REPORT").click
end

Then('I should see the location reported fields are filled by the location of the marker') do
  find(:xpath, "//input[@value='59 Changi South Ave 1, Singapore 485999']")
end

When('I fill all the other required fields') do
  element = find("#description")
  element.fill_in with: "Everthing returns back to normal now. But please keep caution!"
end

Then('I should get back to the place information page of the reported place') do
  sleep(3)
  expect(page).to have_content("Changi South Avenue 1")
end

Then ('I should be able to see the information I just reported') do
  sleep(1)
  expect(page).to have_content("Everthing returns back to normal now. But please keep caution!")
end

When ('I click the return icon') do
    find('.return-icon').click()
end
    
Then('I should get back to the the default map page') do
  sleep(5)
  expect(page).to have_content('Map')
end
