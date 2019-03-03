class CategoriesController < ApplicationController
  before_action :require_logged_in, except: [:show, :index]
  before_action :set_user

  def index
    @categorys = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to @category
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categorys_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
