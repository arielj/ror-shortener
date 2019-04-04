class ShortenedUrl < ApplicationRecord
  BASE_62_DIGITS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

  validates :original_url, presence: true, uniqueness: true

  scope :top, -> { order(views_counter: :desc).limit(100) }

  after_create :enqueue_title_job

  def self.for_url(url)
    find_by(original_url: url) or create(original_url: url)
  end

  def self.for_encoded(encoded)
    find(decode_key(encoded))
  end


  def self.decode_key(encoded)
    base62_to_num(encoded)
  end

  def encoded_key
    self.class.num_to_base62_padded(id)
  end

private
  def enqueue_title_job
    FetchUrlTitleJob.perform_later(id)
  end

  def self.num_to_base62(num)
    return '' if num.nil?

    _next = (num / 62).floor unless num < 62

    "#{num_to_base62(_next)}#{BASE_62_DIGITS[num % 62]}"
  end

  def self.num_to_base62_padded(num, pad = 7)
    raise 'Invalid padding' if num > (62**7-1)

    encoded = num_to_base62(num)
    "0"*(7-encoded.length)+encoded
  end

  def self.base62_to_num(encoded)
    encoded.reverse.each_char.with_index.map do |c, idx|
      BASE_62_DIGITS.index(c) * (62**idx)
    end.sum
  end
end
