class CategoriesController < ApplicationController

  def index
    @categories=Category.all
  end

  def show
    @categories = Category.find(params[:id])
    @products = Product.all

  end
end
