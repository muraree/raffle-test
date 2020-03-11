class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  belongs_to :raffle

  validates :email, presence: true, uniqueness: { case_sensitive: false, scope: :raffle }, format: {with: Devise.email_regexp}
  validates :password, presence: true, confirmation: true, length: { within: Devise.password_length}
end
