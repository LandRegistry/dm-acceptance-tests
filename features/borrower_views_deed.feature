@borrower_views_deed

Feature: Borrower Views the Deed
  As a Borrower
  I want to search for my mortgage document
  So that I can view it

Background:
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API

@us20 @us119 @us85a
Scenario: Borrower enters a valid deed reference

        Deed must display:
         - Borrowers
         - Title number
         - e-MD ref
         - Property address
         - Additional provision
         - Lender
         - Charging clause

  When I navigate to the borrower frontend "/searchdeed" page
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I search for the deed using the unique borrower token
  And I enter the borrowers date of birth
  Then the Your mortgage deed page is displayed
  And the property address is displayed on the deed
  And the Lender is displayed on the deed
  And the Additional provision is displayed on the deed
  And the Charging clause is displayed on the deed

@us20
Scenario: Borrower enters invalid deed reference
  When I navigate to the borrower frontend "/searchdeed" page
  And I search for an invalid deed
  And I enter the borrowers date of birth
  Then the "Deed was not found for:" page is displayed