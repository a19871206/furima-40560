class ItemsController < ApplicationController
  before_action :basic_auth, only: [:index]
  before_action :authenticate_user!, only: [:new, :create, :edit,]
  before_action :set_item, only: [:show, :edit, :update]


  def index
    @items = Item.order(created_at: :desc) 
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
     redirect_to root_path
   else
     render :new, status: :unprocessable_entity
   end
  end

   def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
     redirect_to item_path(@item)
   else
     render :edit, status: :unprocessable_entity
   end
  end


  private

  def item_params
    params.require(:item).permit(:image, :title, :explan, :category_id, :condition_id, :shipping_cost_id, :region_id, :delivery_date_id, :cost).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end