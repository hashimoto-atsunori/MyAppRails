class ChangeJobsNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :jobs, :name, false
  end
end
