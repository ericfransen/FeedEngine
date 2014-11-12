class GoodreadsApi

  attr_reader :client, :key, :secret

  def initialize(user)
    @key    = ENV['goodreads_key']
    @secret = ENV['goodreads_secret']
    @client = OAuth::Consumer.new(@key, @secret, site: 'http://www.goodreads.com')
  end

  # def request_url
  #   self.client.get_request_token.authorize_url
  # end

  def self.get_user_info(user)
    response =  Faraday.get("https://www.goodreads.com/user/show/" +
                             user.goodreads_uid +
                             ".xml?key=" +
                             ENV['goodreads_key'].to_s)
    parser = Nokogiri::HTML(response.body)

  end
end
