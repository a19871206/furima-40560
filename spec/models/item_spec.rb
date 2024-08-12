require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 describe 'バリデーション' do
  context '正常系でできること' do  
  it '有効なアイテム' do
      expect(@item).to be_valid
    end
  end
  context '異常系でのテスト' do
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

   #testcode追加 
    it 'コストが300未満の場合無効' do
        @item.cost = 250
        expect(@item).to be_invalid
        expect(@item.errors.full_messages).to include("Cost 価格は¥300から¥9,999,999の間で入力してください")
      end
    
      it 'コストが9999999を超える場合無効' do
        @item.cost = 10000000
        expect(@item).to be_invalid
        expect(@item.errors.full_messages).to include("Cost must be less than or equal to 9999999")
      end
    
      it 'コストが空では登録できない' do
        @item.cost = ''
        expect(@item).to be_invalid
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end

      it '価格は半角数値であること' do
        @item.cost = 'abc'  # 半角数値以外の文字列
        expect(@item).to be_invalid
        expect(@item.errors.full_messages).to include("Cost is not a number")
      
        @item.cost = 300  # 有効な半角数値
        expect(@item).to be_valid
      end

      it 'ユーザーが紐づいていない場合無効' do
        @item.user = nil
        expect(@item).to be_invalid
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
