# Webmock Net::HTTP Headers as Symbols Bug

When making a request and specifying headers as symbols, an exception is raised
in `Net::HTTP`:

```
bundle exec ruby demo.rb
```

```
/Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http/header.rb:172:in `capitalize': undefined method `split' for :authorization:Symbol (NoMethodError)
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http/header.rb:165:in `block in each_capitalized'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http/header.rb:164:in `each'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http/header.rb:164:in `each_capitalized'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http/generic_request.rb:321:in `write_header'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http/generic_request.rb:136:in `exec'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http.rb:1412:in `block in transport_request'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http.rb:1411:in `catch'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http.rb:1411:in `transport_request'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http.rb:1384:in `request'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http.rb:1377:in `block in request'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http.rb:853:in `start'
  from /Users/cjlarose/.rbenv/versions/2.1.6/lib/ruby/2.1.0/net/http.rb:1375:in `request'
  from /Users/cjlarose/dev/webmock-httparty-headers-bug/make_request.rb:16:in `make_request_net_http'
  from demo.rb:3:in `<main>'
```

But, when stubbing the request with Webmock, no exception is raised:

```
bundle exec ruby -Itest headers_test.rb
```

```
Run options: --seed 61696

# Running tests:

.

Finished tests in 0.002222s, 450.0450 tests/s, 450.0450 assertions/s.

1 tests, 1 assertions, 0 failures, 0 errors, 0 skips
```
