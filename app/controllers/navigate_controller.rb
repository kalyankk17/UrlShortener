class NavigateController < ApplicationController
  def index
    navigator.valid do | shortened_url_obj |
      redirect_to shortened_url_obj.long_url, allow_other_host: true
    end

    navigator.not_valid do
      flash[:alert] = "Shortened URL not found."
      redirect_to root_path
    end
  end

  private

  def navigator
    @navigator ||= Presenter::NavigatePresenter.new(permitted_params)
  end

  def permitted_params
    params.permit(:short_url)
  end
end
