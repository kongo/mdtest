class ListSection < ApplicationRecord
  belongs_to :todo_list
  has_many :tasks, dependent: :destroy
end
