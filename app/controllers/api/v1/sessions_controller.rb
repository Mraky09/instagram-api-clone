class Api::V1::SessionsController < ApplicationController
  before_action :load_user_by_email, only: :create

  def create
    if @user.authenticate_password(user_params[:password])
      user_token = create_user_token(@user)
      render json: Api::V1::UserSerializer.new(
        @user, {
          params: {
            token: user_token.token
          }
        }).serialized_json, status: :ok
    else
      render json: {
        _error: 'Login is not successfully',
        errors: {
          password: 'Is not correct!'
        }
      }, status: :unauthorized
    end
  end

  private

  def load_user_by_email
    @user = User.first(email: user_params[:email])
    return @user if @user

    render json: {
      _error: 'Login is not successfully',
      errors: {
        email: 'Email not found!'
      }
    }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def create_user_token(user)
    user_token = UserToken.new(user: user)
    user_token.renew!
    user_token
  end
end
