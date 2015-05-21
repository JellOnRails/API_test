
class RequestConstructor

  attr_reader :url
  attr_reader :method_url
  attr_reader :headers
  attr_accessor :body

  def initialize
    @url = "api.#{PARAMETERS[ 'development' ]}.getbux.com"
    @method_url = "/core/#{PARAMETERS[ 'version' ]}/users/me"
    @headers = {}
    @body = {}
  end

  def get_api_url( api_method )
    @method_url += PARAMETERS[ api_method ]
  end

  def get_headers
    @headers = HEADERS[ 'request' ]
  end

  def send_post_request
    api_request = Net::HTTP::Post.new( @method_url, @headers )
    api_request.body = @body.to_json

    https = Net::HTTP.new( @url, 443 )
    https.use_ssl = true

    https.request api_request
  end

end