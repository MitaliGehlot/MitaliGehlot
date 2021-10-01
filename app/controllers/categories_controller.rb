class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

 def show
    @category = Category.find(params[:id])

  end
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category_name])
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category = Category.find(params[:category_name])

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to root_path
  end
    private
    def product_params
      params.require(:category).permit(:category_name)
    end

end




