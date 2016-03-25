class User < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: true }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns true if the user has a password assigned to it
  def has_password?
    !password_digest.nil?
  end
end
