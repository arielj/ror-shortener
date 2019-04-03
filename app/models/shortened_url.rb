class ShortenedUrl < ApplicationRecord
  validates :original_url, presence: true, uniqueness: true

  scope :top, -> { order(views_counter: :desc).limit(100) }

  def self.for_url(url)
    find_by(original_url: url) or create(original_url: url)
  end

  def self.for_encoded(encoded)
    find(decode_key(encoded))
  end


  # TODO: decode if from base62
  def self.decode_key(encoded)
    encoded
  end

  # TODO: encode id to base62
  def encoded_key
    id
  end
end
