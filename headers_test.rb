require 'minitest/autorun'
require 'webmock/minitest'
require './make_request'

class HeadersTest < MiniTest::Unit::TestCase
  def setup
    # Disable actual web requests
    WebMock.disable_net_connect!
  end

  def test_request_httparty
    stub_request(:get, "https://api.github.com/users/octocat/orgs")
      .with(:headers => {'Authorization'=>'Bearer 1234'})
      .to_return(:status => 200, :body => "Hello World", :headers => {})
    response = make_request_httparty
    assert_equal 'Hello World', response.body
  end

  def test_request_net_http
    stub_request(:get, "https://api.github.com/users/octocat/orgs")
      .with(:headers => { 'Accept' => '*/*',
                          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                          'User-Agent' => 'Ruby',
                          'Authorization' => 'Bearer 1234' })
      .to_return(:status => 200, :body => "Hello World", :headers => {})
    response = make_request_net_http
    assert_equal 'Hello World', response.body
  end
end
