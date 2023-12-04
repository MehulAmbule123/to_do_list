class AddDefaultToDoneInTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :done, :boolean, default: false
  end
end
