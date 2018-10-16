require 'bcrypt'

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

  def password=(unencrypted_password)
    if unencrypted_password.nil?
      self.password_digest = nil
    elsif !unencrypted_password.empty?
      @password = unencrypted_password
      cost = BCrypt::Engine.cost
      self.password_digest = BCrypt::Password.create(unencrypted_password, cost: cost)
    end
  end

  def authenticate_password(unencrypted_password)
    BCrypt::Password.new(password_digest).is_password?(unencrypted_password) && self
  end
end
