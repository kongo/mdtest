class TodoList < ApplicationRecord
  has_many :list_sections, -> { order("created_at desc") }, dependent: :destroy
  accepts_nested_attributes_for :list_sections
  validates :title, presence: true

  broadcasts_to ->(todo_list) { "todo_lists" }, inserts_by: :prepend

  def serialize_for_template
    {
      title: title,
      description: description,
      list_sections: list_sections.map(&:serialize_for_template)
    }
  end

  def self.create_from_template(template)
    transaction do
      list = create({
        title: template.title,
        description: template.description
      })

      template.contents["list_sections"].each do |list_section_data|
        section = list.list_sections.create(list_section_data.except("tasks"))
        list_section_data["tasks"].each do |task_data|
          section.tasks.create(task_data)
        end
      end

      list
    end
  end
end
