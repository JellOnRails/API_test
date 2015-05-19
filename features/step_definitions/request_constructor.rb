
class RequestConstructor

  attr_reader url: '/'
  attr_reader method_url: '/'
  attr_reader headers: {}

  def initialize
    @url = "https://api.#{PARAMETERS[ 'development' ]}.getbux.com/core/#{PARAMETERS[ 'version' ]}/users/me"
  end

  def get_api_url( api_method )
    @method_url = PARAMETERS[ api_method ]
  end

  def get_headers
    @headers = HEADERS[ 'request' ]
  end

  def send_request( http_method, request_body )
    api_request = Net::HTTP::send( http_method.capitalise ).new( @method_url, @headers )
    api_request.body = request_body

    https = Net::HTTP.new( @url )
    https.use_ssl = true

    https.request api_request
  end

end