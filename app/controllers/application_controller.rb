class ApplicationController < ActionController::Base
  def root
    if Rails.env.production?
      redirect_to 'https://angular-shortener-client.herokuapp.com/shortener'
    else
      redirect_to 'http://localhost:4200'
    end
  end
end
