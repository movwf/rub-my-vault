def get_routing_key(method, path)
  "#{method.to_s}::#{path.to_s}"
end