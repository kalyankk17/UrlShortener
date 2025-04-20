# frozen_string_literal: true
require 'uri'

module UrlShortener

  class Validator

    def initialize(params)
      @params = params
    end

    def validate
      valid_long_url?
      long_url_exists?
    end

    private

    def valid_long_url?
      uri = URI.parse(@params[:long_url])

      raise "Invalid Url Format"  unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
    end

    def long_url_exists?
      raise "Url Already has shortened url" if TinyUrl.find_by_long_url(@params[:long_url])
    end
  end
end