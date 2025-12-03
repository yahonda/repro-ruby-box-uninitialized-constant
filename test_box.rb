#!/usr/bin/env ruby
require 'yaml'
require 'erb'

# Load constants first
require_relative 'constants'

puts "\n--- Loading config.yml with ERB ---"

begin
  # Read the YAML file
  yaml_content = File.read(File.join(__dir__, 'config.yml'))
  
  puts "YAML content before ERB processing:"
  puts yaml_content
  
  # Process ERB
  puts "\nProcessing ERB..."
  erb_result = ERB.new(yaml_content).result
  
  puts "\nYAML content after ERB processing:"
  puts erb_result
  
  # Parse YAML
  config = YAML.load(erb_result)
  
  puts "\nParsed config:"
  puts config.inspect
  
  puts "\n SUCCESS: Config loaded successfully"
rescue NameError => e
  puts "\n ERROR: #{e.class}: #{e.message}"
  puts e.backtrace.first(5)
end
