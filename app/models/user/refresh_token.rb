# frozen_string_literal: true

# User refresh tokens
class User::RefreshToken < ApplicationRecord
  # user have token
  belongs_to :user, class_name: '::User::User',
                    foreign_key: :user_id

  # Create token and set expires_at
  before_validation :create_token, on: %i[create]
  def create_token
    ::ActiveRecord::Base.connection_pool.with_connection do
      self.token ||= loop do
        token = SecureRandom.base58(64)
        break token unless ::User::RefreshToken.find_by(token: token)
      end

      self.expires_at = ::JwtLib::EXPIRES_DAY_COUNT.days.from_now
    end
  end

  ######
  ## Validations
  ######

  validates :token, presence: true,
                    uniqueness: true,
                    on: %i[create update]

  validates :expires_at, presence: true,
                         on: %i[create update]
end
