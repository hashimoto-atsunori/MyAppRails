class ChangeJobsStartTimeAndName < ActiveRecord::Migration[6.0]
  def up
    change_column :jobs, :name , :string, null: false, default: '名無しのタスク'
    change_column :jobs, :start_time , :string 
  end

  def down 
    change_column :jobs, :name , :string, null: false
    change_column :jobs, :start_time , :datetime
  end
end
