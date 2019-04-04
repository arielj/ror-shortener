require 'net/http'

class FetchUrlTitleJob < ApplicationJob
  queue_as :default

  def perform(shortened_url_id)
    shortened = ShortenedUrl.find(shortened_url_id)
    res = fetch(shortened.original_url)
    if res.is_a?(Net::HTTPSuccess)
      document = Nokogiri.parse(res.body)
      if title = document.css('title').first
        shortened.update_column :title, title.text
      end
    end
  end

  def fetch(uri_str, limit = 10)
    raise ArgumentError, 'too many HTTP redirects' if limit == 0

    response = Net::HTTP.get_response(URI(uri_str))

    case response
    when Net::HTTPSuccess then
      response
    when Net::HTTPRedirection then
      location = response['location']
      warn "redirected to #{location}"
      fetch(location, limit - 1)
    else
      response.value
    end
  end
end
