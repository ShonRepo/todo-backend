# frozen_string_literal: true

# Task
class Task::Task < ApplicationRecord
  # The group to which the task is attached
  belongs_to :group, class_name: 'Group::Group',
                     foreign_key: 'group_id'
                    
  # the group that the task will move to if complete
  belongs_to :completed_move, class_name: 'Group::Group',
                              foreign_key: 'group_id',
                              optional: true

  # the group that the task will move to if failed or time ended
  belongs_to :faled_move, class_name: 'Group::Group',
                          foreign_key: 'group_id',
                          optional: true

  ######
  ## Validations
  ######

  validates :title, presence: true

  validates_inclusion_of :is_complete, in: [true, false]

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