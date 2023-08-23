require 'action_controller' # needs rails installed

def render_text(t)
  a = ActionController::Base.new()
  a.render_to_string plain: t
end

def render_erb_text(t,args)
  a = ActionController::Base.new()
  a.render_to_string :inline => t, :locals => args
end

def render_file(f)
  a = ActionController::Base.new()
  a.render_to_string :file => f
end

def render_erb_file(loc, f, args)
  a = ActionController::Base.new()
  a.prepend_view_path loc
  a.render_to_string :template => f, :locals => args
end

