# frozen_string_literal: true

# Group tasks
class Group::Group < ApplicationRecord
  # Groups on wall
  has_many :tasks, class_name: '::Task::Task',
                   dependent: :destroy,
                   foreign_key: :wall_id

  # Task moved on current group if task have complete
  has_many :completeds_move, class_name: '::Task::Task',
                             dependent: :destroy,
                             foreign_key: :completed_move_id

  # Task moved on group if task have failed or time ended
  has_many :faleds_move, class_name: '::Task::Task',
                         dependent: :destroy,
                         foreign_key: :faled_move_id
                        
  # The wall to which the group is attached
  belongs_to :wall, class_name: 'Wall::Wall',
                    foreign_key: 'wall_id'
                    
  # the wall that the group will move to if complete all tasks in group
  belongs_to :completed_move, class_name: 'Wall::Wall',
                              foreign_key: 'wall_id',
                              optional: true

  # the wall that the group will move to if failed all tasks in group or time ended
  belongs_to :faled_move, class_name: 'Wall::Wall',
                          foreign_key: 'wall_id',
                          optional: true

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

  validates :priority,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0
            }

  validates_inclusion_of :archved, in: [true, false]

  validates_inclusion_of :is_infinity, in: [true, false]
  validates :ends_at, presence: true, unless: proc { self.is_infinity }
end