Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "todo_lists#index"

  resources "todo_lists" do
    resources "list_sections", only: [:show, :edit, :new, :create, :update, :destroy] do
      resources "tasks", only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
  end
end
