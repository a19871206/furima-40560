require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 describe 'バリデーション' do
    it '有効なアイテム' do
      expect(@item).to be_valid
    end

    it '画像がない場合無効' do
      @item.image = nil
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'タイトルがない場合無効' do
      @item.title = nil
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it '説明がない場合無効' do
      @item.explan = nil
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Explan can't be blank")
    end

    it 'カテゴリーIDが1の場合無効' do
      @item.category_id = 1
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '状態IDが1の場合無効' do
      @item.condition_id = 1
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it '送料負担IDが1の場合無効' do
      @item.shipping_cost_id = 1
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
    end

    it '地域IDが1の場合無効' do
      @item.region_id = 1
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Region must be other than 1")
    end

    it '配送日IDが1の場合無効' do
      @item.delivery_date_id = 1
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
    end

    it 'コストが0以下の場合無効' do
      @item.cost = 0
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Cost must be greater than 0")
    end
  end
end
