class ListSection < ApplicationRecord
  belongs_to :todo_list
  has_many :tasks, -> { order("created_at desc") }, dependent: :destroy
  validates :title, presence: true

  after_create_commit ->(list_section) {
    broadcast_prepend_to "list_sections", target: list_section.list_dom_id, partial: "list_sections/list_section", locals: { list_section: list_section }
  }

  after_update_commit ->(list_section) {
    broadcast_replace_to "list_sections", target: list_section.dom_id, partial: "list_sections/list_section", locals: { list_section: list_section }
  }

  after_destroy_commit ->(list_section) {
    broadcast_remove_to "list_sections", target: list_section.dom_id
  }

  protected

  def dom_id
    "todo_list_#{todo_list.id}_list_section_#{id}"
  end
  
  def list_dom_id
    "todo_list_#{todo_list.id}_list_sections"
  end
end
