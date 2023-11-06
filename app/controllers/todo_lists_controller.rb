class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = TodoList.all
  end

  def show
    # empty
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new(todo_list_params)

    if @todo_list.save
      redirect_to todo_lists_path, notice: "ToDo list was successfully created."
    else
      render :new
    end
  end

  def edit
    # empty
  end

  def update
    if @todo_list.update(todo_list_params)
      redirect_to todo_lists_path, notice: "ToDo list was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @todo_list.destroy
    redirect_to todo_lists_path, notice: "ToDo list was successfully destroyed."
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(["title", "description"])
  end
end
