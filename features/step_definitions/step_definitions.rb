
# ==== WHEN ====
Given /^Initialize (\w+) API method$/ do | api_method |
  @request.get_api_url api_method
  @request.get_headers
end

When /^I send a POST request with the following body:$/ do | request_body |
  @response = @request.send_post_request( request_body )
end

# ==== THEN ====
Then /^response status code should be (\d+)$/ do | code |
  expect( @response.code ).to eq code
end

Then /^response headers should be in place$/ do
  HEADERS[ 'response' ].each do | title, header |
    expect( @response.header[ title ] ).to eq header
  end
end

Then /^response body should looks like$/ do | body |
  pending #todo implement
end