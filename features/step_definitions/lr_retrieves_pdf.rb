When(/^I retrieve a pdf using the deed id$/) do
  get_pdf_endpoint = Env.deed_api_casework + '/casework/' + @deed_id
  @response = HTTP.get(get_pdf_endpoint)
end

When(/^I retrieve a pdf using an incorrect deed id$/) do
  get_pdf_endpoint = Env.deed_api_casework + '/casework/1234567'
  @response = HTTP.get(get_pdf_endpoint)
end

Then(/^the PDF is returned$/) do
  assert_equal('application/pdf', @response.mime_type)
end
