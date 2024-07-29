def get_all_routes
  [
    {
      :method => :GET,
      :path => "/",
      :view => "views/index.erb",
      :controller => 'Home',
      :action => 'get_home_page'
    }
  ]
end

# require_relative File.join(File.dirname(__FILE__), 'controllers', routes[0][:controller])