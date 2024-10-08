class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
    return redirect_to root_path if @item.user_id == current_user.id || @item.order.present?
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      # OrderとSellerの作成処理
      pay_item
      @order_form.save
      redirect_to root_path
    else
      
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_form).permit(:zip_code, :region_id, :city, :address, :another, :phone_number
    ).merge(
    user_id: current_user.id ,
    item_id: params[:item_id],
    token: params[:token]
    )
  end
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.cost,          # 商品の値段
        card: order_params[:token],  # カードトークン
        currency: 'jpy'              # 通貨の種類（日本円）
      )
    end
end