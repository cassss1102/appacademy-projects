class Api::TodoController < ApplicationController
  def show
    render json: Todo.find(params[:id])
  end

  def index
    render json: @todos = Todo.all
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end 
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: @todo
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :bdoy, :done)
  end
end
