require 'httparty'

def make_request_httparty
  url = 'https://api.github.com/users/octocat/orgs'
  auth_header = 'Bearer 1234'
  # HTTParty.get(url, headers: { 'Authorization' => auth_header })
  HTTParty.get(url, headers: { :Authorization => auth_header })
end
