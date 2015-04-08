class Api::V1::ApiController < ActionController::Base
# Authentication and other filters implementation.

   def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @site = Business::App.where(access_token: token).first
      @token = token
    end
  end

end
