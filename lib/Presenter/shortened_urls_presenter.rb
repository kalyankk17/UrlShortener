module Presenter

  class ShortenedUrlsPresenter

    attr_reader :urls_details, :domain_name
    def initialize(user_signed_in, current_user,session_id )
      @session_id = user_signed_in ? current_user.id : session_id
    end

    def get_shortened_urls_details
      @urls_details = TinyUrl.where(session_id: @session_id.to_s).order(created_at: :desc)
      self
    end

    def on_details_exists(request)
      return unless @urls_details

      @domain_name = "#{request.protocol}#{request.host}:#{request.port}/"
      yield self if block_given?
    end

    def on_details_not_exists
      yield unless @urls_details
    end

    def create_shortened_url(params)
      UrlShortener::Updater.new(params, @session_id).update
    end
  end
end