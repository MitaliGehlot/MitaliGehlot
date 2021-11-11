class CategoriesController < ApplicationController
  before_action :set_category, only:[:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

 

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  

  def update

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  def search
   @categories = Category.search(params[:search])
  end  

 private

    def category_params
      params.require(:category).permit(:category_name, :search)
    end

    def set_category
      @category = Category.find(params[:id])
    end  
end




