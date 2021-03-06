Given(/^I have deed data with two borrowers one which has no gender$/) do
  @deed_hash = {
    title_number: 'CYM123456',
    md_ref: 'e-MD12344',
    identity_checked: 'Y',
    property_address: '1 High Street, High Wycombe, CR0 6TY',
    borrowers: [
      {
        forename: 'Ann',
        surname: 'Smith',
        gender: 'Female',
        address: '1 The High Street Highley CR0 9YH',
        dob: '29/09/1965',
        phone_number: '07507154077'
      },
      {
        forename: 'Ann',
        surname: 'Smith',
        address: '1 The High Street Highley PL6 7TG',
        dob: '29/09/2000',
        phone_number: '07507154076'
      }
    ]
  }
end
