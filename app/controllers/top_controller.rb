class TopController < ApplicationController
  def index
    @top = ShortenedUrl.top
  end
end
