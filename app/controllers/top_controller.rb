class TopController < ApplicationController
  def index
    render json: {top: ShortenedUrl.top}.to_json
  end
end
