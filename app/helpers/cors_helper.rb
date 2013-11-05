module CorsHelper
  #def cors_set_access_control_headers
  #  if request.headers['HTTP_ORIGIN']
  #    headers['Access-Control-Allow-Origin'] = request.headers['HTTP_ORIGIN']
  #    headers['Access-Control-Expose-Headers'] = 'ETag'
  #    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
  #    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
  #    headers['Access-Control-Max-Age'] = '86400'
  #    headers['Access-Control-Allow-Credentials'] = 'true'
  #
  #  end
  #end


  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
  end

end
