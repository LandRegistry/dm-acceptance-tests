# Generic way to enter values into DOB field e.g "12/2/1976"
When(/^I enter "([^"]*)" as the date of birth$/) do |dob|
  split_dob = dob.split('/')
  fill_in 'dob-day', with: split_dob[0]
  fill_in 'dob-month', with: split_dob[1]
  fill_in 'dob-year', with: split_dob[2]
  click_button('Continue')
end

# Extension of the Generic method. Enters DOB for specific Borrower
# OR first borrower by default
When(/^I enter the date of birth(?: for borrower <(\d+)>)?$/) do |borrower|
  borrower ||= 1
  split_dob = @deed.borrowers[borrower.to_i - 1][:dob].split('/')
  fill_in 'dob-day', with: split_dob[0]
  fill_in 'dob-month', with: split_dob[1]
  fill_in 'dob-year', with: split_dob[2]
  click_button('Continue')
end
