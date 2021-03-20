class PurchasesController < ApplicationController
  
  def index
      @product = Product.find(params[:product_id])
      @purchase_buyer = PurchaseBuyer.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    if @purchase_buyer.valid? 
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number)
  end

end
