class NavigateController < ApplicationController
  def index
    tiny_url = TinyUrl.find_by(short_url: params[:short_url])
    if tiny_url
      tiny_url.increment!(:visit_count)
      redirect_to tiny_url.long_url, allow_other_host: true
    else
      flash[:alert] = "Shortened URL not found."
      redirect_to root_path
    end
  end
end
