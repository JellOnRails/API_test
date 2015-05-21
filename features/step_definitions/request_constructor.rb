
class RequestConstructor

  attr_reader :url
  attr_reader :method_url
  attr_reader :headers

  def initialize
    @url = "api.#{PARAMETERS[ 'development' ]}.getbux.com"
    @method_url = "/core/#{PARAMETERS[ 'version' ]}/users/me"
    @headers = {}
  end

  def get_api_url( api_method )
    @method_url += PARAMETERS[ api_method ]
  end

  def get_headers
    @headers = HEADERS[ 'request' ]
  end

  #todo check and remove
  def normalize_body( request_body )
    request_body.gsub( "\n", '' ).gsub( /\s+/, ' ' )
  end

  def send_post_request( request_body )
    api_request = Net::HTTP::Post.new( @method_url, @headers )
    api_request.body = request_body  #todo check and remove -> normalize_body( request_body )

    https = Net::HTTP.new( @url, 443 )
    https.use_ssl = true

    https.request api_request
  end

end