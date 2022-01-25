# frozen_string_literal: true

# Remove expires tokens
class RemoveExpiresTokenJob < ApplicationJob
  queue_as :default

  def perform
    query = <<~SQL
      DELETE FROM user_refresh_tokens
      WHERE user_refresh_tokens.expires_at < CURRENT_TIMESTAMP
    SQL

    ActiveRecord::Base.connection.exec_query(
      ActiveRecord::Base.send(
        :sanitize_sql_array, [
          query
        ]
      )
    )
  end
end