require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kempelen'

require 'minitest/autorun'
require "minitest/reporters"

# Use the appropriate reporter for the UI in use.
Minitest::Reporters.use!
