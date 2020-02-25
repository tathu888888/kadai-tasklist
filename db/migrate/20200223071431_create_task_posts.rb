class CreateTaskPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :task_posts do |t|
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
