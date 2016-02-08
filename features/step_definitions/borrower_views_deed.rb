And(/^I retrieve the deed id$/) do
  response_hash = JSON.parse(@response.body)
  @get_url = response_hash['url']
end

And(/^I retrieve the unique user id using the URL$/) do
  @response = HTTP.get(@get_url)
  deed_hash = JSON.parse(@response.body)
  @borrower_token = deed_hash['deed']['borrowers'][0]['token']
end

Then(/^the Your mortgage deed page is displayed$/) do
  page.should have_content('Your mortgage deed')
  page.should have_content(@deed.title_number)
  page.should have_content(@deed.md_ref)
end

And(/^the Lender is displayed on the deed$/) do
  page.should have_css('h3', text: 'Lender')
  page.should have_content('Bank of England Plc 12 Trinity Place, Regents '\
                           'Street, London NW10 6TQ Company registration '\
                           'number: 2347676')
end

And(/^the Additional provision is displayed on the deed$/) do
  page.should have_css('h3', text: 'Additional provisions:')
  page.should have_content('This Mortgage Deed incorporates the Lenders '\
                           'Mortgage Conditions and Explanation 2006, a '\
                           'copy of which the borrower has received. The '\
                           'lender is obliged to make further advances '\
                           'and applies for the obligation to be entered '\
                           'in the register. The borrower applies to enter '\
                           'a restriction in the register that no '\
                           'disposition of the registered estate by the '\
                           'proprietor of the registered estate is to be '\
                           'registered without a written consent signed by '\
                           'the proprietor for the time being of the charge '\
                           'dated [the date of this charge] in favour of '\
                           'Bank of England Plc referred to in the charges '\
                           'register.')
end

And(/^the Charging clause is displayed on the deed$/) do
  page.should have_css('h3', text: 'Charging clause:')
  page.should have_content('The borrower, with full title guarantee, charges '\
                           'to the lender the property by way of legal '\
                           'mortgage with payment of all money secured by '\
                           'this charge.')
end

Then(/^the property address is displayed on the deed$/) do
  page.should have_content(@deed.address)
end

And(/^confirm your deed information text is displayed on the deed page$/) do
  page.should have_content('If you are happy with the details shown on your '\
                           'mortgage deed above, please continue.')
  page.should have_content('If something is wrong you should contact your '\
                           'conveyancer')
end
