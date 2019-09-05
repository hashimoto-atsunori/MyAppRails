class ChangeJobsName < ActiveRecord::Migration[6.0]
  def up
    change_column :jobs, :name, :string, null: true
    change_column_default :jobs, :name, nil 
  end

  def down 
    change_column :jobs, :name, :string, null: false, default: '名無しのタスク'
    change_column_default :jobs, :name, '名無しのタスク'
  end
end
