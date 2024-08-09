require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '無効な場合' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end

      
      it 'passwordが不正な形式では登録できない' do
        @user.password = 'abcde' # 英字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include "Password 半角英数字を入力してください"
      end

      it '全角のみのパスワードでは登録できない' do
        @user.password = 'パスワード'
        @user.password_confirmation = 'パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password 半角英数字を入力してください'
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password 半角英数字を入力してください'
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      
      it 'last_nameが全角でない場合は登録できない' do
        @user.last_name = 'Yamada' # 半角
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角で入力してください"
      end
      
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      
      it 'first_nameが全角でない場合は登録できない' do
        @user.first_name = 'Taro' # 半角
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角で入力してください"
      end
      
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      
      it 'last_name_kanaが全角カタカナでない場合は登録できない' do
        @user.last_name_kana = 'やまだ' # ひらがな
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角カタカナで入力してください"
      end
      
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      
      it 'first_name_kanaが全角カタカナでない場合は登録できない' do
        @user.first_name_kana = 'たろう' # ひらがな
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カタカナで入力してください"
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end

      # デバイスを導入したらオリジナルで下記を追記して確認をすること

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end    

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
#デバイスを導入したらオリジナルで上記を追記して確認をすること


    end
  end
end
