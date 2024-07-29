require 'agoo'

require_relative '../helpers/get_route_actions'
require_relative '../helpers/get_route_views'
require_relative '../helpers/get_routing_key'
require_relative '../helpers/render'

class Home
  def initialize
    @actions = get_route_actions('Home')
    @views = get_route_views('Home')
  end
  
  def call(req)
    method = req['REQUEST_METHOD']
    path = req['PATH_INFO']

    route_key = get_routing_key(method, path)
    action = @actions[route_key]

    req[:ROUTE_KEY] = route_key; 

    # Agoo::Log.info("#{req.to_json}")
    
    self.send(action, req)    
  end

  def get_home_page(req)
    route_key = req[:ROUTE_KEY]

    render(@views[route_key], { "name" => "Testingen" })
   end
end