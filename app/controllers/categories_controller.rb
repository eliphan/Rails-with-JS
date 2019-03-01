class CategoriesController < ApplicationController
  def index
    @categorys = category.all
  end

  def show
    @category = category.find(params[:id])
  end

  def new
    @category = category.new
  end

  def create
    @category = category.new(category_params)
    @category.save
    redirect_to @category
  end

  def update
    @category = category.find(params[:id])
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  def edit
    @category = category.find(params[:id])
  end

  def destroy
    @category = category.find(params[:id])
    @category.destroy
    redirect_to categorys_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
