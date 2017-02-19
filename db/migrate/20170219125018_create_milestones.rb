class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.text :description
      t.integer :author_id
      t.integer :state
    end
  end
end
