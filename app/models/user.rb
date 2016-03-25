class User < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: true }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
