class AddDoneAndPublicToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :done, :boolean
    add_column :tasks, :public, :boolean
  end
end
