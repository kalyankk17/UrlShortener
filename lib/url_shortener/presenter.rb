# frozen_string_literal: true

module UrlShortener
  class Presenter
    def initialize
    end

    def create_shortened_url(params, session_id)
      TinyUrl::Updater.new(params, session_id).update
    end
  end
end