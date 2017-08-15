require 'rubygems'
require 'minitest/autorun'
require 'unicode'

require "lib/simhash"
require "lib/simhash/string"
require "lib/simhash/integer"

begin
  require "string_hashing"
rescue LoadError
  nil
end
