class User < ApplicationRecord
  SessionKey = :user9999
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  before_create :encrypt_password

  def self.login(user)
    password = Digest::SHA1.hexdigest("a#{user[:password]}z")
    User.find_by(email: user[:email], password: password)
  end

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end
end
