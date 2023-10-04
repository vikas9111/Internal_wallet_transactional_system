class User < ApplicationRecord
  has_one :user_wallet, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :stocks, dependent: :destroy
  after_create :create_user_wallet

  def authenticate(pass)
    return self if password == pass

    false
  end

  def generate_auth_code
    self.auth_token = SecureRandom.hex(16)
    self.token_expires_at = 1.hour.from_now
    self.save
  end
end
