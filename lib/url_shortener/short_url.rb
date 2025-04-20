# frozen_string_literal: true
module UrlShortener
  class ShortUrl

    def initialize(long_url)
      @long_url = long_url
    end

    def generate
      Base62Converter.string_to_base62(@long_url)
    end
  end
end
