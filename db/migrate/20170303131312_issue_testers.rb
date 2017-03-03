class IssueTesters < ActiveRecord::Migration[5.0]
  def change
    create_table :issue_testers do |t|
      t.integer :tester_id
      t.integer :issue_id
      t.timestamps
    end
  end
end
