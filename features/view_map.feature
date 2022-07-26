Feature: view the map

  As a responder who wants to deliver aid to requesters, Emily
  I want to know where are the dangerous spots
  so that I can move within war zones safely and deliver help.


Scenario: view the map with my current location (GPS + display)
  Given I go to the default map page
  Then I should see a map with my current location at the center


Scenario: search for a new location on the map (Searching Autocomplete + setCenter) 
  Given I am currently on the map page
  When I enter the location with SUTD on the default map page
  Then I should see the address of SUTD inside the field on the default map page
  And I should see a map with the new location at the center


# Scenario: view detailed information of a selected location (Place Information Page)
# Given I am currently on the map page
# When I click a marker @1.342715,103.953041 whose id is 31 on the map
# Then I should be directed to the place information page with the detailed information about potential dangers at the selected location


Scenario: view detailed information of a selected location (Infinite scroll)
  Given I am currently on the place information page of SUTD
# When I scroll through the place information page
  Then I should see more and more reviews about the potential dangers at the location

Scenario: check whether the report information shown is true (check info -> API test)
  Given I am currently on the place information page of SUTD 
  When I look at the first report on the place information page
  Then I should see the user name of the user who reports.
  And I should see the correct content of the user’s reports displayed

Scenario: check whether the place information (from google map) shown is true (check info -> API test)
  Given I am currently on the place information page of SUTD 
  When I look at the first report on the place information page
  Then I should see the user name of the user who reports.
  And I should see the correct content of the user’s reports displayed

Scenario: check whether the position of marker is correct
  Given I try to access the place information page of Changi City Point which has been reported by others
  Then I should be redirected to its place information page successfully

# Scenario: move the map and load new markers (correct markers displayed)
# Given I am currently on the map page
# When I drag the map to see the nearby places
# Then I should see the markers in position on the map
