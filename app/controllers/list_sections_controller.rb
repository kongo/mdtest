class ListSectionsController < ApplicationController
  before_action :set_todo_list
  before_action :set_list_section, except: [:new, :create]

  def index
    @list_sections = @todo_list.list_sections.order("created_at desc").all
  end

  def show
    # empty
  end

  def new
    @list_section = @todo_list.list_sections.new
  end

  def create
    @list_section = @todo_list.list_sections.new(list_section_params)

    if @list_section.save
      respond_to do |format|
        format.html { redirect_to list_sections_path, notice: "Section was successfully created."}
        format.turbo_stream { flash.now[:notice] = "Section list was successfully created."}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # empty
  end

  def update
    if @list_section.update(list_section_params)
      redirect_to todo_list_list_section_path(@list_section.todo_list, @list_section), notice: "Section list was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list_section.destroy
    respond_to do |format|
      format.html { redirect_to list_sections_path, notice: "Section list was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_list_section
    @list_section = @todo_list.list_sections.find(params[:id])
  end

  def list_section_params
    params.require(:list_section).permit(["title"])
  end
end
