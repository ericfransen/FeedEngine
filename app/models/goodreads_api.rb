class GoodreadsApi

  attr_reader :client, :key, :secret

  def initialize
    @key    = ENV['goodreads_key']
    @secret = ENV['goodreads_secret']
    @client = OAuth::Consumer.new(@key, @secret, site: 'http://www.goodreads.com')
  end

  def request_url
    self.client.get_request_token.authorize_url
  end
end
