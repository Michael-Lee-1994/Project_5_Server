class User < ApplicationRecord
  has_secure_password
  has_many :user_shows, dependent: :destroy
  validates :username, uniqueness: true, length: {minimum: 5}
  # validates :password, length: {minimum: 5}
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email invalid" }, length: { minimum: 4}
  validates :first_name, :last_name, presence: true
end
