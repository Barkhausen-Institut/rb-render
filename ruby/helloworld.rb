require './render'

rendered = render_text "Hello World"
puts rendered

rendered = render_erb_text("Hello <%= word %>", {:word => "World"})
puts rendered

rendered = render_file "./hello_world_file.erb"
puts rendered

rendered = render_erb_file(".", "hello", {:word => "World"})
puts rendered
