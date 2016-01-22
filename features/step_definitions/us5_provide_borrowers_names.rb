Given(/^I have deed data with a borrower with a middle name$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:middle_name] = 'Johnny'
  @deed_hash = @deed.to_hash
end

Given(/^I have deed data with a borrower with no name$/) do
  @deed = Deed.new(1)
  @deed.borrowers[0][:forename] = ''
  @deed.borrowers[0][:surname] = ''
  @deed_hash = @deed.to_hash
end
