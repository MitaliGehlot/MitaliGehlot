class WishlistController < ApplicationController
  before_action :set_product, only: [:index, :new, :show,:destroy]

def index
  @wishlist =  @product.wishlist.all
end

# def new
#   @wishlist =  @product.wishlist.new
# end

def show
 @wishlist = Wishlist.find(params[:id])
  flash[:success] = "wishlist"
end

def create
  @product =Product.find(params[:product_id])
  @wishlist = @product.wishlist.new(wishlist_params)
   if @wishlist.save!
      flash[:success] = "wishlist"
     redirect_to product_wishlist_path(@product , @wishlist)
    else
     flash.now[:error] = "......"
    render :new
  end

def destroy
  @products =Product.find(params[:id])
  @wishlist.destroy
  redirect_to root_path (@order)
  end
end

def mywishlist
  @wishlist = Wishlist.all
end  

private


def wishlist_params
  params.require(:product).permit(:name, :price, :model , :file)
end

def set_product
  @product =Product.find(params[:product_id])
end 
end