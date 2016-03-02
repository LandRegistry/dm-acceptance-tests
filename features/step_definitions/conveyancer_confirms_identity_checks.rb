Given(/^conveyancer is not confirming borrower identity check$/) do
  @deed = Deed.new(1)
  @deed.identity_checked = 'N'
  @deed_hash = @deed.to_hash
end

Given(/^conveyancer has submitted an empty identity check value$/) do
  @deed = Deed.new(1)
  @deed.identity_checked = ''
  @deed_hash = @deed.to_hash
end