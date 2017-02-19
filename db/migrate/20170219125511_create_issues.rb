class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :author_name
      t.string  :issue_url
      t.string  :name
      t.text  :description
      t.integer :milestone_id
    end
  end
end
