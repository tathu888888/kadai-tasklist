class AddStatusToTaskPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :task_posts, :status, :string
  end
end
