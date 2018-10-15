class User < Sequel::Model
  plugin :validation_helpers

  one_to_many :user_tokens

  def validate
    super
    validates_presence [:email]
  end

  class << self
    def from_access_token(token)
      user_token = UserToken.find_by(token: token)
      return unless user_token
      user_token.user
    end
  end
end
