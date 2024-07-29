require_relative '../helpers/get_routing_key'
require_relative '../routes'

def get_route_views(controller_name)
  all_routes = get_all_routes()

  all_routes.reduce({}) do |acc, route|
    method, controller, path, view = route.values_at(:method,
                                                     :controller,
                                                     :path,
                                                     :view)
  
    if controller == controller_name
      acc[get_routing_key(method, path)] = view
    end
  
    acc
  end
end