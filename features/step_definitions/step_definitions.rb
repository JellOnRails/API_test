
# ==== WHEN ====
Given /^Initialize (\w+) API method$/ do | api_method |
  @request.get_api_url api_method
  @request.get_headers
end

When /^add (\w+) with (\w+) type (\w+) to body request$/ do | param, value, type |
  value = value.to_i if type == 'Integer'
  @request.body[ param ] = value
end

When /^add (\w+) with (\w+) type (\w+) to (\w+) body$/ do | param, value, type, parent |
  value = value.to_i if type == 'Integer'
  @request.body[ parent ] = {} if @request.body[ parent ].nil?
  @request.body[ parent ][ param ] = value
end

When /^send POST request$/ do
  @response = @request.send_post_request
  @response_body = JSON.parse @response.body
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

Then /^(\w+) should be (\w+) type and match (.*) pattern$/ do | param, type, regexp |
  expect( @response_body ).to include param
  expect( @response_body[ param ] ).to be_a type
  expect( @response_body[ param ] ).to match regexp
end

Then /^(\w+) should be (\w+) type, nested to (\w+) and have (\w+) value$/ do | param, type, parent, value |
  value = value.to_i if type == 'Integer'
  expect( @response_body[ parent ] ).to include param
  expect( @response_body[ parent ][ param ] ).to be_a type
  expect( @response_body[ parent ][ param ] ).to eq value
end

Then /^(\w+) should be (\w+) type and have (\w+) value$/ do | param, type, value |
  value = value.to_i if type == 'Integer'
  expect( @response_body ).to include param
  expect( @response_body[ param ] ).to be_a type
  expect( @response_body[ param ] ).to eq value
end

Then /^(\w+) should be (\w+) type$/ do | param, type |
  expect( @response_body ).to include param
  expect( @response_body[ param ] ).to be_a type
end
