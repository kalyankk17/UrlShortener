class ShortenedUrlsController < ApplicationController
  def show
    shortened_url_details = initialize_presenter.get_shortened_urls_details

    shortened_url_details.on_details_exists(request) do |shortened_url_detail_objs|
      @details = shortened_url_detail_objs
    end

    shortened_url_details.on_details_not_exists do
      flash[:alert] = "No URL details found for this session."
      redirect_to root_path and return
    end
  end

  def create
    shortened_url_creator = initialize_presenter.create_shortened_url(permitted_params)

    shortened_url_creator.on_success do
      redirect_to shortened_urls_show_path
    end

    shortened_url_creator.on_error do | result |
      flash[:alert] = "Error: #{result.error.join(', ')}"
      redirect_to root_path
    end
  end

  private

  def initialize_presenter
    Presenter::ShortenedUrlsPresenter.new(user_signed_in?, current_user, session.id)
  end

  def permitted_params
    params.permit(:long_url)
  end
end
