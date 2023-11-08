class ChangeTextColumnsToString < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :description, :string
    change_column :todo_lists, :description, :string
  end
end
