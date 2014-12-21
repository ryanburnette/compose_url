# compose_url

**compose_url** is a Ruby class that abstracts away the details composing a URL
with query paramters.

## Usage

Instantiate `compose_url` by passing a `base_url`.

```ruby
url = ComposeURL.new('http://api.com/1/a')
```

Include some initial query parameters either in the initial `base_url` or as a Hash. Or both at the same time.

```ruby
url = ComposeURL.new('http://api.com/1/a', { 'foo' => 'bar', 'baz' => 'grault' })
```

```ruby
url = ComposeURL.new('http://api.com/1/a?foo=bar&baz=grault')
```

```ruby
url = ComposeURL.new('http://api.com/1/a?foo=bar', { 'baz' => 'grault' })
```

Add additional params to the resulting `ComposeURL` object.

```ruby
url.add_param('a', 'b')
```

The `@params` Hash is accessible using Ruby’s `attr_accessor`, so it can be treated directly as a Hash.

```ruby
url.params['c'] = 'd'
url.params.merge!({ 'e' => 'f' })
```

Remove a key value pair by calling `remove_param` on the key.

```ruby
url.remove_param('a')
```

Retrieve your composed URL string by calling `url` or `to_s`.

```ruby
url.to_s
```

## Installation

Install as a gem.

```bash
gem install compose_url
```

Or add to your `Gemfile` and `bundle install`.

```ruby
# Gemfile
gem "compose_url"
```

```bash
bundle install
```

## Todo

* Support URL hash as it’s described as [Relative Reference in RFC 3986][2]
* Validate keys and values according to [application/x-www-form-urlencoded][4]
* Improve validation based on suggestions to this [Stack Overflow question][1]
* Improve custom error class
* Self-contained testing

## History

* v0.1.3 2014-12-20
  * Define dependencies in Gemspec

* v0.1.2 2014-12-02
  * Fix bug where params could be escaped twice
  * Rely more on existing Ruby libraries

* v0.1.1 2014-12-01
  * Parse out params in the initial `base_url` and add them to the `@params` hash

* v0.1.0 2014-12-01
  * Initial release

## Contributing

Open an [Issue](https://github.com/ryanburnette/compose_url/issues) or bring a [Rull Request](https://github.com/ryanburnette/compose_url/pulls)!

## License

[Apache2](https://github.com/ryanburnette/compose_url/blob/master/LICENSE)

[1]: http://stackoverflow.com/questions/27234822/what-constitutes-a-valid-uri-query-parameter-key
[2]: http://tools.ietf.org/html/rfc3986#section-4.2
[3]: http://tools.ietf.org/html/rfc3986#section-3.4
[4]: http://www.w3.org/TR/html401/interact/forms.html#h-17.13.4.1