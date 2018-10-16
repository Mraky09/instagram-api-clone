class Api::V1::UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :first_name, :last_name

  attribute :token do |_, params|
    params[:token]
  end
end
