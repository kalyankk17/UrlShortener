# frozen_string_literal: true
module Presenter

  class NavigatePresenter

    def initialize(params)
      @short_url = params[:short_url]
      get_tiny_url
    end

    def valid
      return unless @shortened_url_obj

      @shortened_url_obj.increment!(:visit_count)
      yield @shortened_url_obj if block_given?
    end

    def not_valid
      yield unless @shortened_url_obj
    end

    private

    def get_tiny_url
      @shortened_url_obj = TinyUrl.find_by(short_url: @short_url)
    end
  end
end