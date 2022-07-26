Feature: Add dangerous location
  As a victim in war zone that had seen unexploded mine being placed around a certain place, Eric
  I want to inform others about the unexploded mine’s location
  so that others will avoid that location and be safe.

Scenario: display the form (display)
  Given I am at the default map page
  When I click the REPORT DANGERS button to add a dangerous location
  Then I should be redirected to the risk report page with a form displayed


Scenario: autocomplete & auto parse & autofilling
  Given I am at the add the risk report page
  When I enter the location with SUTD
  And I select the option containing SUTD in the autocomplete
  Then I should see the address of SUTD inside the field

Scenario: post information of a “previously safe” location via the add button on the default page
  Given I am at the default map page
  And I click the REPORT DANGERS button to add a dangerous location
  And I fill all the required information 
  And I click post button
  Then I should be able to see a successful toast
  And I should get back to the default map page 
  
  
Scenario: post using the current location (GPS)
  Given I am at the default map page
  And I click the REPORT DANGERS button to add a dangerous location
  When I check the current location box
  Then I should see the location field is auto-filled with the parsed address via GPS

Scenario: validate the filled information before submission (input validation)
  Given I am at the default map page
  And I click the REPORT DANGERS button to add a dangerous location
  When I fill half of the required fields
  And I click post button
  Then I should see a red warning beside the submit button
  Then I should see the required fields which I forget to fill are highlighted in red.


Scenario: display the form correctly by reporting from the place information page
  Given I am at the place information page of SUTD
  When I click the REPORT button to add a dangerous location on the place information page
  Then I should be redirected to the risk report page with a form displayed
  And I should see the location reported fields are filled by the location of the marker 


Scenario: post a (already dangerous) location via searching a specific location
  Given I am at the place information page of SUTD
  And I click the REPORT button to add a dangerous location on the place information page
  When I fill all the other required fields
  And I click post button
  Then I should be able to see a successful toast
  And I should get back to the default map page


Scenario: Check whether post successfully
   Given I am at the place information page of SUTD
   Then I should be able to see the information I just reported


Scenario: return from the form page which is directed from the place information page
  Given I am at the place information page of SUTD
  And I click the REPORT button to add a dangerous location on the place information page
  When I click the return icon
  Then I should get back to the place information page of the reported place

Scenario: return from the form page which is directed from the default map page
  Given I am at the default map page
  And I click the REPORT DANGERS button to add a dangerous location
  When I click the return icon
  Then I should get back to the the default map page
  