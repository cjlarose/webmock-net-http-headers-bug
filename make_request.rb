require 'net/https'
require 'uri'

def make_request_net_http
  uri = URI.parse 'https://api.github.com/users/octocat/orgs'
  auth_header = 'Bearer 1234'

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(uri.request_uri)
  # request['Authorization'] = auth_header
  request[:Authorization] = auth_header

  http.request(request)
end
