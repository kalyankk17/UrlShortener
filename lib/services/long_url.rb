# frozen_string_literal: true
require 'base62'
class LongUrl
  def initialize(short_url)
    @short_url = short_url
  end

  def generate
    @short_url.base62_decode
  end
end
