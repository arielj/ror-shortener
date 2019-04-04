class ShortenerController < ApplicationController
  skip_before_action :verify_authenticity_token

  def shorten
    @shortened = ShortenedUrl.for_url(params[:url])
  end
end
