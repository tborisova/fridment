class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :issue_id
      t.boolean :state
      t.text    :description
      t.timestamps
    end
  end
end
