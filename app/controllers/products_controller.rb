class ProductsController < ApplicationController
  #before_action :move_to_index, except: [:index, :show]

  #def index
  #end

  #def move_to_index
  #  unless user_signed_in?
  #    redirect_to action: :index
  #  end
  #end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create
  end


private

  def product_params
    params.require(:product).permit(:content, :image).merge(user_id: current_user.id)
  end
end
