class ApplicationController < ActionController::Base
  def root
    redirect_to 'http://localhost:4200'
  end
end
