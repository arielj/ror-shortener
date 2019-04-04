class ExpanderController < ApplicationController
  def expand
    @shortened = ShortenedUrl.for_encoded(params[:encoded])
    @shortened.increment!(:views_counter)

    redirect_to @shortened.original_url if request.format.html?
  end
end
