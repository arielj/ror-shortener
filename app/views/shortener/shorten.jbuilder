if @shortened.valid?
  json.url shortened_url(@shortened.encoded_key)
else
  json.errors @shortened.errors[:original_url]
end
