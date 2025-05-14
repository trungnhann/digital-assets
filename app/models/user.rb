# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)      not null
#  full_name       :string(50)       not null
#  password_digest :string           not null
#  role            :string           default("customer")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  MAX_NAME_LENGTH = 50
  MIN_PASSWORD_LENGTH = 6
  MAX_EMAIL_LENGTH = 255
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_secure_password

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: MAX_EMAIL_LENGTH },
                    format: { with: VALID_EMAIL_REGEX }
  validates :full_name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :password, length: { minimum: MIN_PASSWORD_LENGTH }, if: -> { password.present? }
  validates :password_confirmation, presence: true, on: :create

  enum :role, { admin: 'admin', creator: 'creator', customer: 'customer' }

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
