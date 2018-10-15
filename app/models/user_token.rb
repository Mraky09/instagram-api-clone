class UserToken < Sequel::Model
  plugin :validation_helpers

  many_to_one :user

  def validate
    super
    validates_presence [:user, :token, :refresh_token, :expired_at]
  end

  def renew!
    update(token: generate_unique_secure_token, refresh_token: generate_unique_secure_token,
      expired_at: Time.zone.now + 30.days)
  end

  def expired?
    expired_at <= Time.zone.now
  end

  def expire!
    update(expired_at: Time.zone.now)
  end

  private

  def generate_unique_secure_token
    SecureRandom.base58(24)
  end
end
