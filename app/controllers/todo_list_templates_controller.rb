class TodoListTemplatesController < ApplicationController
  before_action :set_todo_list

  def new
    @todo_list_template = TodoListTemplate.new(@todo_list.attributes.slice("title", "description"))
  end

  def create
    @todo_list_template = TodoListTemplate.new_from_todo_list(@todo_list, todo_list_template_params)

    if @todo_list_template.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Template was successfully created."}
        format.turbo_stream { flash.now[:notice] = "Template was successfully created."}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def todo_list_template_params
    @todo_list_template = params.require(:todo_list_template).permit(["title", "description"])
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end
end
