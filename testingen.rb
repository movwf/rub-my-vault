require_relative 'routes'

all_routes = get_all_routes()

home_routes = all_routes.reduce({}) do |acc, route|
  method, controller, path, view = route.values_at(:method, :controller, :path, :view)

  if controller == 'Home'
    key = "#{method.to_s}::#{path.to_s}"
    acc[key] = view
  end

  acc
end

puts home_routes