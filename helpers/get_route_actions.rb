require_relative '../routes'
require_relative '../helpers/get_routing_key'

def get_route_actions(controller_name)
  all_routes = get_all_routes()

  all_routes.reduce({}) do |acc, route|
    method, controller, action, path = route.values_at(:method,
                                                       :controller,
                                                       :action,
                                                       :path)
  
    if controller == controller_name
      acc[get_routing_key(method, path)] = action
    end
  
    acc
  end
end