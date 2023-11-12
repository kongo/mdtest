class Task < ApplicationRecord
  belongs_to :list_section
  delegate :todo_list, to: :list_section
  validates :title, presence: true

  def serialize_for_template
    {
      title: title,
      description: description
    }
  end
end
