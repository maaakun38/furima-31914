class PurchasesController < ApplicationController
  before_action :set_product

  def index
    redirect_to new_user_session_path unless user_signed_in?
    if current_user == @product.user
      redirect_to root_path 
    end
      @purchase_buyer = PurchaseBuyer.new
  end

  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)

    if @purchase_buyer.valid? 
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchase_params
    params.require(:purchase_buyer).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
