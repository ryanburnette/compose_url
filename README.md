# compose_url

**compose_url** is a Ruby class that helps you compose a URL string without all the fuss.

## Usage

Instantiate `compose_url` by passing a `base_url`, optionally with some `params`.

```ruby
url = ComposeURL.new('http://api.com/1/a')
```

```ruby
url = ComposeURL.new('http://api.com/1/a', { 'foo' => 'bar', 'baz' => 'grault' })
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

## Version History

* v0.1.0 2014-12-01
  * Initial release 

## Contributing

Bring on the Pull Requests!

## License

Apache2

[1]: http://stackoverflow.com/questions/27234822/what-constitutes-a-valid-uri-query-parameter-key
[2]: http://tools.ietf.org/html/rfc3986#section-4.2
[3]: http://tools.ietf.org/html/rfc3986#section-3.4
[4]: http://www.w3.org/TR/html401/interact/forms.html#h-17.13.4.1