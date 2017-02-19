class Milestone < ActiveRecord::Base
  has_many   :issues
  belongs_to :author, class_name: 'User'
end