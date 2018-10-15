class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: Api::V1::UserSerializer.new(users).serialized_json, status: :ok
  end
end
