Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "todo_lists#index"

  resources "todo_lists" do
    collection do
      get "new_from_template"
      post "new_from_template", to: "todo_lists#create_from_template"
    end
    resources "list_sections", only: [:show, :edit, :new, :create, :update, :destroy] do
      resources "tasks", only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
  end

  resources "todo_list_templates", only: [ :new, :create ]
end
