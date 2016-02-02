@add_property_address
  Feature: Conveyancer provides a single property address
  As a conveyancer I want to be able to provide a property address
  So that it can be included on the mortgage deed


Acceptance Criteria
  -Property provided must be a single property address
  -It needs to look like an address
  -Commas provided in the address indicate a new line (apart from when it follows
   a number or a number followed by a letter in the first)
  -Commas are not displayed on the address when borrower views deed

@us85a
Scenario: No property address provided
  Given I do not have a property address to provide
  When I create the deed via the Deed API
  Then a status code of "400" is returned
  And a message for failure is given "Failed validating 'pattern' in schema['properties']['property_address']:"

@us106
Scenario: Input property address formatted with commas
  Given I have a property address that is formatted with commas
  When I create the deed via the Deed API
  When I navigate to the borrower frontend "/searchdeed" page
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I search for the deed using the unique borrower token
  And I enter the borrowers date of birth
  Then the Your mortgage deed page is displayed
  And the property address is formatted correctly
