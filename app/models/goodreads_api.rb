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

  def self.get_current_books(user)
    url = "https://www.goodreads.com/review/list/" +
                             user.goodreads_uid +
                             ".xml?key=" +
                             ENV['goodreads_key'].to_s +
                             "&v=2"
    response =  Faraday.get(url)

    parser = Nokogiri::XML(response.body)

    results = parser.css('review').to_a.keep_if do |review|
                review.css('shelf[name=currently-reading]').count > 0
              end

    current_books = results.map{|r| r.css('book title').text}
                    .each { |title| title.split(' ').map(&:capitalize).join(' ') }

  end

end
