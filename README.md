# README

* Ruby version
- developed using Ruby 2.4.4

* System dependencies
- mysql

* Configuration
- set database config at /config/database.yml

* Database creation
- run `bundle exec rails db:create` and `bundle exec rails db:migrate`

* Database initialization
- With the server runing at localhost:3000, run the script `ruby populate_database.rb`
  It requires the gem *curb* for the CURL request.

* How to run the test suite
-

* Services (job queues, cache servers, search engines, etc.)
-

* Deployment instructions



# Url shortening algorithm
The idea behind this approach is to use chars on the shortened url to represent
the integer record ID on the database.

Using one single char we can represent numbers from 0 to 61: using number from
0 to 9, letters from 'a' to 'z' and letters from 'A' to 'Z'. That way:
  a (base62) == 10 (base10)
  b (base62) == 11 (base10)
  ...
  B (base62) == 37 (base10)
  ...
  Z (base62) == 61 (base10)

With more chars, the maximum representable base10 integer grows exponentially:
  1 char = 62
  2 chars = 62^2 = 3844
  3 chars = 62^3 = 238328
  ...
  6 chars = 62^6 = 56.800.235.584
  ...

We can represent millons of record IDs with a fraction of the bytes if we were
using only digits from 0 to 9.

Now we use that base62 encoding of the ID as the identifier of the shortened url.


The algorithm consistes of 4 steps
1 - Create a new record on the database with the provided URL so it gets an ID

2 - Encode the record ID as BASE62
  `def self.num_to_base62(num)
    # return '' to stop the recursive calls
    return '' if num.nil?

    # if the number is greater than 61, divide by 62 and save the
    _next = (num / 62).floor unless num < 62

    # call this function again and concatenate the result with the char at
    # position num % 62
    "#{num_to_base62(_next)}#{BASE_62_DIGITS[num % 62]}"
  end`

3 - Use the encoded ID as the path of the shortened url

4 - Decode the BASE62 string back to an integer to query the record from the database
  `def self.base62_to_num(encoded)
    #iterate the string on reverse order and map to numbers
    encoded.reverse.each_char.with_index.map do |c, idx|

      # get the index of the char from the constant and multiply that number
      # by 62 at the power of idx where idx is the index of the iteration
      BASE_62_DIGITS.index(c) * (62**idx)

    # finally, sum al the numbers from the map
    end.sum
  end`
