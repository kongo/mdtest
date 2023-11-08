class CreateTodoListTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_list_templates do |t|
      t.string :title
      t.string :description
      t.json :contents
      t.timestamps
    end
  end
end
