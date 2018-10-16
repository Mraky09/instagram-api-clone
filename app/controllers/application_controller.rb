class ApplicationController < ActionController::API

  protected

  def current_user
    @current_user ||= User.from_access_token(access_token)
  end

  def authenticate_with_token!
    return true if current_user
    render json: {
      _error: 'Token is invalid!'
    }, :unauthorized
  end

  def access_token
    authorization_header = request.headers['Authorization']
    pattern = /^Bearer /
    header.gsub(pattern, '') if header.match(pattern)
  end
end
