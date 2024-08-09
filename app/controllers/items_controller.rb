class ItemsController < ApplicationController
  before_action :basic_auth, only: [:index]
  def index
    @items = Item.all
  end
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

  private

def basic_auth
  authenticate_or_request_with_http_basic do |username, password|
    username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD'] # 環境変数を読み込む記述に変更
  end
  def item_params
    params.require(:item).permit(:name, :description, :region_id, :image) # 画像を追加
  end
end
