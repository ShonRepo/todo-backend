# frozen_string_literal: true

# Wall for task groups
class Wall::Wall < ApplicationRecord
  # All walls user
  has_many :user_walls, class_name: '::User::Wall',
                        dependent: :destroy,
                        foreign_key: :wall_id

  # Groups on wall
  has_many :groups, class_name: '::Group::Group',
                    dependent: :destroy,
                    foreign_key: :wall_id

  # group moved on current wall if all task in group have complete
  has_many :completeds_move, class_name: '::Group::Group',
                             dependent: :destroy,
                             foreign_key: :completed_move_id

  # group moved on current wall if all task in group have failed or time ended
  has_many :faleds_move, class_name: '::Group::Group',
                         dependent: :destroy,
                         foreign_key: :faled_move_id

  ######
  ## Validations
  ######

  validates :name, presence: true

  validates :priorities_count,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0
            }

  validates_inclusion_of :archved, in: [true, false]

  validates_inclusion_of :is_infinity, in: [true, false]
  validates :ends_at, presence: true, unless: proc { self.is_infinity }
end
