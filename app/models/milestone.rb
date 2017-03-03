class Milestone < ActiveRecord::Base
  has_many   :issues
  belongs_to :author, class_name: 'User'

  MILESTONE_STATES = {
    1 => 'in progress',
    2 => 'finished'
  }
end