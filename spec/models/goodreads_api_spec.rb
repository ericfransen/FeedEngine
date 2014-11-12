require 'rails_helper'

RSpec.describe GoodreadsApi, :type => :class do

  describe '#get_current_books' do

    context 'given valid Oauth data' do

      it 'retrieves an array of user\'s current books' do
        VCR.use_cassette('get_user_goodread_review_xml') do
          # stub_request(:get, "https://www.goodreads.com/user/show/18828400.xml?key=80Wj3BQNYGrVYjBv2mOM3A").
          # with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0'}).
          # to_return(:status => 200, :body => "", :headers => {})

          user  = FactoryGirl.create(:user)
          oauth = FactoryGirl.create(:oauth_account, user_id: user.id)
          goodreads_current_books = GoodreadsApi.get_current_books(user)
          expect(goodreads_current_books).to be_kind_of(Array)
        end
      end
    end
  end
end
