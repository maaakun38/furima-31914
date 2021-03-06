class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_user

  def index
      @purchase_buyer = PurchaseBuyer.new
  end

  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    if @purchase_buyer.valid? 
      settlement_system
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
    params.require(:purchase_buyer).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_user
    if current_user == @product.user
      redirect_to root_path 
    elsif Purchase.exists?(product_id: @product.id)
      redirect_to root_path 
    end
  end

  def settlement_system
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @product.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end


end
