# frozen_string_literal: true
module UrlShortener
  class Updater

    attr_reader :error

    def initialize(params, session_id)
      @params = params
      @session_id = session_id
      @error = []
    end

    def update
      begin
        Validator.new(@params).validate
        shorted_url = ShortUrl.new(@params[:long_url]).generate
        update_attributes(shorted_url)
      rescue => e
        @error << e
      end
      self
    end

    private

    def update_attributes(shorted_url)
      url_details = TinyUrl.new
      url_details.long_url = @params[:long_url]
      url_details.short_url = shorted_url
      url_details.session_id = @session_id
      url_details.save!
    end
  end
end
