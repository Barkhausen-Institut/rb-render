require 'erb'
require 'tilt'
require 'tilt/erb'

template = Tilt::ERBTemplate.new('./hello.html.erb')
output = template.render(Object.new, :word => "World")
puts output
