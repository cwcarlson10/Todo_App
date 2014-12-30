class ToDosController < ApplicationController
  def index
    @todos = ToDo.all
  end

  def show
    @todo = ToDo.find(params[:id])
  end

  def new
    @todo = ToDo.new
  end

  def create
    @todo = ToDo.create(todo_params)
    if @todo.save
      redirect_to @todo
    else
      render :new
    end
  end

  def edit
    @todo = ToDo.find(params[:id])
  end

  def update
    @todo = ToDo.find(params[:id])
    if @todo.update_attributes(todo_params)
      redirect_to @todo
    else
      render :edit
    end
  end

  def destroy
    @todo = ToDo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end

  private

    def todo_params
      params.require(:to_do).permit(:title, :category, :priority, :is_completed)
    end
end
