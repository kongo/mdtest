class Task < ApplicationRecord
  belongs_to :list_section
  delegate :todo_list, to: :list_section
end
