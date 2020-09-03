Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
       origins '*'
       resource '*', :headers => :any, :methods => [:get, :post, :options]
     end
  end

Rails.application.config.action_dispatch.default_headers.merge!(
"Access-Control-Allow-Origin" => "*")
