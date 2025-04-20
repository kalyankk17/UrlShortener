class ShortenedUrlsController < ApplicationController
  def show
    if user_signed_in?
      @urls_details = TinyUrl.where(session_id: current_user.id.to_s).order(created_at: :desc)
    else
      @urls_details = TinyUrl.where(session_id: session.id.to_s).order(created_at: :desc)
    end
    @domain_name = "#{request.protocol}#{request.host}:#{request.port}/"
    unless @urls_details
      flash[:alert] = "No URL details found for this session."
      redirect_to root_path and return
    end
  end

  def create
    if user_signed_in?
      user_id = current_user.id.to_s
    else
      user_id = session.id
    end

    updater = UrlShortener::Updater.new(params, user_id)
    result = updater.update

    if result.error.empty?
      redirect_to shortened_urls_show_path
    else
      flash[:alert] = "Error: #{result.error.join(', ')}"
      redirect_to root_path
    end
  end
end
