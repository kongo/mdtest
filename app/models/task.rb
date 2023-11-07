class Task < ApplicationRecord
  belongs_to :list_section
  delegate :todo_list, to: :list_section

  after_create_commit ->(task) {
    broadcast_append_to "tasks", target: task.list_dom_id, partial: "tasks/task", locals: { task: task }
  }

  after_update_commit ->(task) {
    broadcast_replace_to "tasks", target: task.dom_id, partial: "tasks/task", locals: { task: task }
  }

  after_destroy_commit ->(task) {
    broadcast_remove_to "tasks", target: task.dom_id
  }

  protected

  def dom_id
    "todo_list_#{todo_list.id}_list_section_#{list_section.id}_task_#{id}"
  end
  
  def list_dom_id
    "todo_list_#{todo_list.id}_list_section_#{list_section.id}_tasks"
  end
end
