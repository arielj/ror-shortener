class ShortenerController < ApplicationController
  skip_before_action :verify_authenticity_token

  def shorten
    shortened = ShortenedUrl.for_url(params[:url])
    render json: {url: shortened.encoded_key}.to_json
  end
end
