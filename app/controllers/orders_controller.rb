class OrdersController < ApplicationController
  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id]) # 購入するアイテムの取得
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      # OrderとSellerの作成処理
      order = Order.create(user_id: current_user.id, item_id: @order_form.item_id)
      Seller.create(order: order, zip_code: @order_form.zip_code, region_id: @order_form.region_id,
                    city: @order_form.city, address: @order_form.address,
                    another: @order_form.another, phone_number: @order_form.phone_number)
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:zip_code, :region_id, :city, :address, :another, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end