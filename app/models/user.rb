class User < ApplicationRecord
  has_secure_password
  has_many :organizations
  has_many :joined_organizations, through: :members, source: :organization
  has_many :members, through: :organizations

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, :length => { :minimum => 2 }
  validates :password, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
