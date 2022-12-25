# frozen_string_literal: true

# class of model
class User < ApplicationRecord
  include FriendshipsHelper
  has_secure_password

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :gifts, dependent: :destroy
  has_many :givers, through: :gifts

  before_create :confirmation_token

  validates :login, presence: true, uniqueness: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :login, presence: true, uniqueness: true
  validates :f_name, presence: true, format: { with: /\A[a-zа-яА-ЯA-Z]+\z/, message: 'Имя может содержать только буквы' }
  validates :l_name, presence: true, format: { with: /\A[a-zа-яА-ЯA-Z]+\z/, message: 'Фамилия может содержать только буквы' }
  validates :password_confirmation, presence: { message: 'не может быть пустым' }
  validates :password, confirmation: { message: 'Пароли не совпадают' }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}\z/, message: 'Пароль должен иметь минимум прописную, заглавную буквы, цифру и иметь длину больше 8 символов' }

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    save!(validate: false)
  end

  def reset_password!(password, password_confirmtion)
    self.reset_password_token = nil
    self.password = password
    self.password_confirmation = password_confirmtion
    save
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end
end
