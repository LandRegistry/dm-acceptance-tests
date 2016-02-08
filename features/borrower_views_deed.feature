@borrower_views_deed

Feature: Borrower Views the Deed
  As a Borrower
  I want to search for my mortgage document
  So that I can view it

Background:
  Given I have valid deed data with <1> borrowers
  And I create the deed via the Deed API

@us20 @us119 @us85a @us133a
Scenario: Borrower enters a valid deed reference

        Deed must display:
         - Borrowers
         - Title number
         - e-MD ref
         - Property address
         - Additional provision
         - Lender
         - Charging clause

  When I navigate to the borrower frontend "/borrower-reference" page
  And I retrieve the deed id
  And I retrieve the unique user id using the URL
  And I search for the deed using the unique borrower reference
  And I enter the borrowers date of birth
  And when I click on the "Continue" link
  Then the Your mortgage deed page is displayed
  And the property address is formatted correctly
  And the Lender is displayed on the deed
  And the Additional provision is displayed on the deed
  And the Charging clause is displayed on the deed
  And confirm your deed information text is displayed on the deed page


