class TasksController < ApplicationController
  before_action :set_todo_list
  before_action :set_list_section
  before_action :set_task, except: [:new, :create]

  def show
    # empty
  end

  def new
    @task = @list_section.tasks.new
  end

  def create
    @task = @list_section.tasks.new(task_params)

    if @task.save
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Task was successfully created."}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # empty
  end

  def update
    if @task.update(task_params)
      redirect_to todo_list_list_section_task_path(@task.todo_list, @task.list_section, @task), notice: "Task list was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @task, notice: "Section list was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_list_section
    @list_section = @todo_list.list_sections.find(params[:list_section_id])
  end

  def set_task
    @task = @list_section.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(["title", "description", "is_checked"])
  end
end
