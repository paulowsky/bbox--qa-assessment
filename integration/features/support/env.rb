require 'cucumber'
require 'httparty'
require 'yaml'
require 'json'
require 'jsonpath'
require 'json-schema'
require 'rspec'
require 'pry'

TARGET ||= ENV['TARGET']
ISPARALLELRUNNING ||= ENV['PARALLELRUNNING']
VERSION ||= ENV['VERSION']

TARGET_DATA = YAML.load_file(File.dirname(__FILE__) +
                "/env/api/#{TARGET}.yml")

$url = "#{TARGET_DATA[:url]}/#{VERSION}"

puts "URL: #{$url}"

$project_root = File.expand_path(File.join(File.dirname(__FILE__), '/../..'))

Cucumber::Core::Test::Step.module_eval do
  def name
    return text if text == 'Before hook'
    return text if text == 'After hook'
    "#{source.last.keyword}#{text}"
  end
end
