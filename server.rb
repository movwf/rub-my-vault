require 'agoo'
require 'json'
require 'cgi'
require 'erb'

require_relative 'routes'
require_relative 'lib/render_handler'
require_relative 'lib/static_handler'
require_relative 'controllers/Home'

Agoo::Server.init(6464, './root')

# routes = get_all_routes()
# controllers = {}

# routes.each do |route|
#   controller = route.values_at(:controller)

#   require_relative File.join(File.dirname(__FILE__), 'controllers', controller)

#   controllers[controller[0]] = Object.const_get(controller[0]).new
# end

# routes.each do |route|
#   method, path, view, controller, action = route.values_at(:method, :path, :view, :controller, :action)
#   locals = controllers[controller].send(action)

#   Agoo::Server.handle(method, path, RenderHandler.new(view, locals))
# end

# class MyHandler
#   def call(req)
#     qs = req["QUERY_STRING"]
#     qur = CGI.parse(qs);

#     [ 
#       200, 
#       { 'Content-Type' => 'application/json' }, 
#       [ {:test => qur}.to_json ]
#     ]
#   end
# end

home_handler = Home.new()

Agoo::Server.handle(:GET, '/static/*', StaticHandler.new())
Agoo::Server.handle(:GET, '/', home_handler)

Agoo::Server.start()