class CreateShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.text :original_url, index: {length: 1000}
      t.integer :views_counter, default: 0, index: true
    end
  end
end
