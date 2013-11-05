class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    if request.headers['HTTP_ORIGIN']
      headers['Access-Control-Allow-Origin'] = request.headers['HTTP_ORIGIN']
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
      headers['Access-Control-Max-Age'] = '86400'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end


end
