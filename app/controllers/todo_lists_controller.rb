class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = TodoList.order("updated_at desc").all
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
      respond_to do |format|
        format.html { redirect_to todo_lists_path, notice: "ToDo list was successfully created."}
        format.turbo_stream { flash.now[:notice] = "ToDo list was successfully created."}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # empty
  end

  def update
    if @todo_list.update(todo_list_params)
      redirect_to todo_lists_path, notice: "ToDo list was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_path, notice: "ToDo list was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(["title", "description"])
  end
end
