
# ==== GIVEN ====
Given /^Initialize (\w+) API method$/ do | api_method |
  @request.get_api_url api_method
  @request.get_headers
end

# ==== WHEN ====
When /^I send a (\w+) request with the following body:$/ do | http_method, request_body |
  @response = @request.send_request( http_method, request_body )
end