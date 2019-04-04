require 'curb'

urls = [
  'https://www.google.com',
  'https://google.com',
  'https://www.facebook.com',
  'https://www.fb.com',
  'https://www.yahoo.com',
  'https://www.duckduckgo.com',
  'https://www.amazon.com',
  'https://www.amazon.co.uk',
  'https://www.amazon.es',
  'https://www.ebay.com',
  'https://www.reddit.com',
  'https://www.tumblr.com',
  'https://www.instagram.com',
  'https://www.snapchat.com',
]

urls.each do |url|
  http = Curl.post('http://localhost:3000/url', {url: url})
  puts "#{url} => #{http.body_str}"
end
