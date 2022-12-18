# frozen_string_literal: true

# class of model
class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :gifts, dependent: :destroy
  has_many :givers, through: :gifts

  before_create :confirmation_token

  has_secure_password

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  #validates :password_digest, presence: true, uniqueness: true

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end
end
