class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = selected_cat
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = selected_cat
    render :edit
  end

  def update
    @cat = selected_cat

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end

  def selected_cat
    Cat.find_by(id: params[:id])
  end
end
