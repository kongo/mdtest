class TodoList < ApplicationRecord
  has_many :list_sections, dependent: :destroy
  validates :title, presence: true

  broadcasts_to ->(todo_list) { "todo_lists" }, inserts_by: :prepend
end
