class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    @category.save
    redirect_to @category
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:book])
      flash[:notice] = "Category was updated."
      redirect_to @category
    else
      flash[:error] = "There was an error saving the category. Please try again."
      render :edit
    end
  end
  
end