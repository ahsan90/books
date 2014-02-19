class CategoriesController < ApplicationController
  def new
    @category = Category.new(params[:id])
    authorize! :create, Category, message: "You need to be a moderator to create a new category."
  end

  def edit
    @category = Category.find(params[:id])
    authorize! :edit, @category, message: "You need to be a moderator to do that."
  end

  def create
    @category = Category.new(params[:category])
    authorize! :create, @category, message: 'You need to be a moderator to do that.'
    if @category.save
      redirect_to books_path
    end
  end

  def update
    @category = Category.find(params[:id])
    authorize! :update, @category, message: "You need to be a moderator to do that."
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category was updated."
      redirect_to books_path
    else
      flash[:error] = "There was an error saving the category. Please try again."
      render :edit
      redirect_to books_path
    end
  end
  
end