class ApplicationController < ActionController::Base
  def root
    redirect_to FRONTEND_BASE_URL
  end
end
