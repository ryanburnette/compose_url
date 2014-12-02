require 'cgi'
require 'uri'

class ComposeURL
  attr_accessor :params

  def initialize(base_url, params={})
    @url = init_url(base_url)
    @params = init_params(base_url).merge(params)
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

  def init_url(base_url)
    base_url[/[^?]+/]
  end

  def init_params(base_url)
    base_url.gsub(init_url(base_url), '').gsub('?', '').split('&').inject({}) {|h, pair|
      pair = pair.split('=')
      h[pair[0]] = pair[1]
      ; h
    }
  end

  def validate_url(url)
    raise ComposeURLError.new('Resulting URL is invalid') unless url =~ /\A#{URI::regexp}\z/
    url
  end

  def params_string
    @params.map { |k,v|
      "#{escape(k)}=#{escape(v)}"
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
