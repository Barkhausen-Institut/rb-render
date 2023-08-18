require 'action_controller' # needs rails installed

def helloworld
  a = ActionController::Base.new()
  a.render_to_string plain: 'Hello World'
end

rendered = helloworld()
puts rendered

