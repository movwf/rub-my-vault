require 'agoo'

class StaticHandler
  def call(req)
    path = req['PATH_INFO']
    file_path = path[1..-1]
    
    if File.exist?(file_path) && !File.directory?(file_path)
      content = File.read(file_path)

      [200, { 'Content-Type' => mime_type(file_path) }, [content]]
    else
      [404, { 'Content-Type' => 'text/plain' }, ['File not found']]
    end
  end

  private

  def mime_type(file_path)
    case File.extname(file_path)
    when '.html'
      'text/html'
    when '.css'
      'text/css'
    when '.js'
      'application/javascript'
    else
      'application/octet-stream'
    end
  end
end
