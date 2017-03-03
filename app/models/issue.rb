require 'net/https'
require 'open-uri'

class Issue < ActiveRecord::Base
  has_many   :testers, class_name: 'User'
  has_many   :comments
  belongs_to :milestone


  def testers
    tester_ids = IssueTester.where(issue_id: id).map(&:tester_id)
    User.where(id: tester_ids)
  end
end