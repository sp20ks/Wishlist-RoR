# frozen_string_literal: true

# class of model
class User < ApplicationRecord

  has_many :friendships, dependent: :destroy  
  has_many :friends, through: :friendships

  has_many :gifts, dependent: :destroy  
  has_many :givers, through: :gifts

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true
end
