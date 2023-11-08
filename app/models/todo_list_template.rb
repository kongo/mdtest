class TodoListTemplate < ApplicationRecord
  attr_accessor :todo_list_id

  def self.new_from_todo_list(todo_list, additional_attributes = {})
    new({
      title: todo_list.title,
      description: todo_list.description,
      contents: todo_list.serialize_for_template
    }.merge(additional_attributes))
  end
end
