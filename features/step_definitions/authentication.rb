
# ==== WHEN ====
When /^Set (\w+) header with (\w+)$/ do | header, value |
  @request.headers[ header ] = HEADERS[ header ][ value ]
end