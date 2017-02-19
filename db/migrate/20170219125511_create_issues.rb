class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string   :assignee_name
      t.string   :issue_url
      t.string   :name
      t.text     :description
      t.integer  :milestone_id
      t.integer  :number
      t.timestamps
    end
  end
end
