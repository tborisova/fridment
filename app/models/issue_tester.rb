class IssueTester < ActiveRecord::Base

  def self.create_testers(testers_ids, issue_id)
    testers_ids.each do |tester_id|
      IssueTester.create(tester_id: tester_id, issue_id: issue_id)
    end
  end
end