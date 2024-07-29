require 'erb'

class RenderHandler
  def initialize(viewPath, locals)
    @viewPath = viewPath
    @locals = locals
  end

  def call(req)
    render(@viewPath, @locals)
  end

  
  def render(path, locals = {})
    template = ERB.new(File.read(path))
    body = template.result_with_hash(locals)

    [200, { 'Content-Type' => 'text/html' }, [body]]
  end
end
