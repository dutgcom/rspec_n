require "rspec_n/version"

require "colorize"
require "cri"
require "open3"
require "pathname"

require "rspec_n/helpers/time_helpers"
require "rspec_n/helpers/core_ext/array"
require "rspec_n/helpers/core_ext/string"

require "rspec_n/errors/bad_option"

require "rspec_n/constants"
require "rspec_n/input"
require "rspec_n/runner"
require "rspec_n/run"
require "rspec_n/formatters/file_formatter"
require "rspec_n/formatters/table_formatter"

# Setup pry for development when running "rake console". Guard against load
# errors in production (since pry is only loaded as a DEVELOPMENT dependency
# in the .gemspec)
# rubocop:disable Lint/SuppressedException
begin
  require "pry"
rescue LoadError
end
# rubocop:enable Lint/SuppressedException
