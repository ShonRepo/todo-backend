# frozen_string_literal: true

# User model
class User::User < ApplicationRecord
  has_secure_password validations: false
  alias_attribute :password_digest, :encrypted_password

  # user Refresh tokens
  has_many :refresh_tokens, class_name: '::User::RefreshToken',
                            dependent: :destroy,
                            foreign_key: :user_id

  # User walls
  has_many :user_walls, class_name: '::User::Wall',
                        dependent: :destroy,
                        foreign_key: :user_id

  ######
  ## Validations
  ######

  validates :full_name, presence: true

  validates :email, uniqueness: true,
                    presence: true,
                    format: { with: /\A([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}\z/ },
                    on: %i[create update]
end
