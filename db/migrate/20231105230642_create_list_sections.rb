class CreateListSections < ActiveRecord::Migration[7.1]
  def change
    create_table :list_sections do |t|
      t.string :title
      t.references :todo_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
