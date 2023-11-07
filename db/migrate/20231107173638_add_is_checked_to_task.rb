class AddIsCheckedToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :is_checked, :boolean, default: false
  end
end
