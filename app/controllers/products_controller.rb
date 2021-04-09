class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :sold_out, only: [:edit, :update, :destroy]
  before_action :purchase_history, only: [:index, :show]


  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit 
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    end
  end

private

  def product_params
    params.require(:product).permit(:image, :title, :price, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @product.user
  end

  def sold_out
    if Purchase.exists?(product_id: @product.id)
      redirect_to root_path 
    end
  end

  def purchase_history
    @purchase = Purchase.all
  end

end