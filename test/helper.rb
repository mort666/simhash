require 'rubygems'
require 'minitest/autorun'
require 'unicode'

require "lib/simhash"
require "lib/string"
require "lib/integer"
begin
  require "string_hashing" 
rescue LoadError
  nil
end
