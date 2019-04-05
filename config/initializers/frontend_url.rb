FRONTEND_BASE_URL = if Rails.env.production?
  'https://angular-shortener-client.herokuapp.com/'
else
  'http://localhost:4200/'
end
