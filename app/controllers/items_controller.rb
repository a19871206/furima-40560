class ItemsController < ApplicationController
  before_action :basic_auth, only: [:index]
  before_action :authenticate_user!, only: [:new, :create,]

  def index
    @items = Item.order(created_at: :desc) 
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id # ユーザーIDを設定

    if @item.save
     redirect_to root_path, notice: '商品が作成されました。'
   else
     render :new, status: :unprocessable_entity
   end
  end

   def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explan, :category_id, :condition_id, :shipping_cost_id, :region_id, :delivery_date_id, :cost).merge(user_id: current_user.id)
  end
end