require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe 'バリデーション' do
    context '正常系でできること' do  
      it '有効なアイテム' do
        expect(@order_form).to be_valid
      end
      it '建物名がなくても登録できる' do
        @order_form.another = nil
        expect(@order_form).to be_valid
      end
    end

    context '異常系でのテスト' do
      it 'tokenがない場合無効' do
        @order_form.token = nil
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      
      it 'user_idが空の場合無効' do
        @order_form.user_id = nil
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空の場合無効' do
        @order_form.item_id = nil
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it '電話番号が10桁以上11桁以内ではない場合無効' do
        @order_form.phone_number = '999999999' # 9桁
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Phone number 10桁以上11桁以内")
      end

      it '郵便番号がない場合無効' do
        @order_form.zip_code = nil
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Zip code can't be blank")
      end

      it '郵便番号がハイフンなしの場合無効' do
        @order_form.zip_code = '1234567' # ハイフンなしの郵便番号
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Zip code 3桁ハイフン4桁")
      end

      it '都道府県がない場合無効' do
        @order_form.region_id = 1
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Region must be other than 1")
      end

      it '市区町村がない場合無効' do
        @order_form.city = nil
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地がない場合無効' do
        @order_form.address = nil
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がない場合無効' do
        @order_form.phone_number = nil
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上の場合無効' do
        @order_form.phone_number = '999999999999' # 12桁
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Phone number 10桁以上11桁以内")
      end

      it '電話番号に英数字以外が含まれている場合無効' do
        @order_form.phone_number = '12345abcde' # 英数字以外を含む
        expect(@order_form).to be_invalid
        expect(@order_form.errors.full_messages).to include("Phone number 10桁以上11桁以内")
      end

    
    end
  end
end