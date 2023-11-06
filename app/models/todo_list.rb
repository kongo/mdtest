class TodoList < ApplicationRecord
  has_many :list_sections, -> { order("created_at desc") }, dependent: :destroy
  validates :title, presence: true

  broadcasts_to ->(todo_list) { "todo_lists" }, inserts_by: :prepend
end
