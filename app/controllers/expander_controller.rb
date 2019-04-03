class ExpanderController < ApplicationController
  def expand
    shortened = ShortenedUrl.for_encoded(params[:encoded])
    shortened.increment!(:views_counter)
    respond_to do |format|
      format.json { render json: {url: shortened.original_url} }
      format.html { redirect_to shortened.original_url }
    end
  end
end
