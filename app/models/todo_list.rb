class TodoList < ApplicationRecord
  has_many :list_sections
  validates :title, presence: true
end
