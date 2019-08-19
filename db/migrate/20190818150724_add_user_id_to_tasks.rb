class AddUserIdToTasks < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM jobs;'
    add_reference :jobs, :user, null: false, index: true
  end

  def down 
    remove_reference :jobs, :user, index: true
  end
end
