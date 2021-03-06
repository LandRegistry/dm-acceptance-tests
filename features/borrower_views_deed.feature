@borrower_views_deed

Feature: Borrower Views the Deed
  As a Borrower
  I want to search for my mortgage document
  So that I can view it

Acceptance Criteria:
  Deed must display:
    - Borrowers
    - Title number
    - e-MD ref
    (US85a)Property address
    - Additional provision
    - Lender
    - Charging clause
  (US121) Date box is displayed on the deed
  (US121) Have text on screen which says: " This charge takes effect when the registrar receives notification from [name of conveyancer preparing the charge] that the charge is to take effect."
  (US122) The borrower signature boxes must align with how they are formatted on the prototype
  (US122) Must accept one to four borrowers

@us20 @us119 @us85a @us133a @us121 @us133 @us188 @us193
Scenario: Borrower enters a valid deed reference
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  And the mortgage deed is displayed
  Then the borrower signature elements are present on page

@us122 @us133
Scenario: 4 Borrower signature boxes are displayed on the deed
  Given I create default deed with <1> borrowers
  And borrower <1> views the deed
  And the mortgage deed is displayed
  Then the borrower signature elements are present on page

@us119a
Scenario: Borrower views their mortgage Deed where the Lender is Coventry Building
Society. Lender Name, Address, Additional provisions and Society ref reflect the
Coventry Building Societies Mortgage Deed.
  Given I create default deed with <1> borrowers
  And I amend "md_ref" to "e-MD047W" for borrower <1>
  When I create the deed
  And borrower <1> views the deed
  Then the Coventry Building Society mortgage deed is displayed
