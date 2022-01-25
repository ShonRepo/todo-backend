# frozen_string_literal: true

# Users wall
class User::Wall < ApplicationRecord
  # User attached to a wall
  belongs_to :user, class_name: 'User::User',
                    foreign_key: 'user_id'

  # Wall owned by user
  belongs_to :wall, class_name: 'Wall::Wall',
                    foreign_key: 'wall_id'
end