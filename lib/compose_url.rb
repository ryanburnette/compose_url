require 'cgi'
require 'uri'

class ComposeURL
  attr_accessor :params

  def initialize(baseurl, params={})
    @url = baseurl
    @params = params
  end

  def add_param(k, v)
    @params[k] = v
  end

  def remove_param(k)
    @params.delete(k)
  end

  def url
    validate_url(build_url)
  end

  def to_s
    url
  end

  private

  # todo: is this a valid key?
  def validate_key(k)
    raise ComposeURLError.new('Invalid key') unless k == escape(k) # key shouldn't require escaping, or should it?
    escape(k)
  end

  # todo: is this a valid value?
  def validate_value(v)
    escape(v)
  end

  def validate_url(url)
    raise ComposeURLError.new('Resulting URL is invalid') unless url =~ /\A#{URI::regexp}\z/
    url
  end

  def params_string
    @params.map { |k,v|
      "#{validate_key(k)}=#{validate_value(v)}"
    }.join('&')
  end

  def escape(s)
    CGI.escape(s)
  end

  def build_url
    @params.length == 0 ? "#{@url}" : "#{@url}?#{params_string}"
  end

  # todo: support arrays
  # todo: support hash
end

class ComposeURLError < StandardError
  # todo: custom error handling
end
