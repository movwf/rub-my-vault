require 'erb'

def render(file_path, state = {})
  template = ERB.new(File.read(file_path))
  body = template.result_with_hash(state)

  [200, { 'Content-Type' => 'text/html' }, [body]]
end

