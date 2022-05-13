require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録ユーザー情報' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、name、kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname =""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email =""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email ="aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password =""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password ="absd8"
        @user.password_confirmation =@user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password ="88888888"
        @user.password_confirmation =@user.password
        @user.valid?        
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password ="abcd08"
        @user.password_confirmation ="abcd09"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end

  describe '新規登録本人情報確認' do
    context '新規登録できないとき' do
      it 'お名前(全角)は、名字が空では登録できない' do
        @user.first_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'お名前(全角)は、名前が空では登録できない' do
        @user.last_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'お名前(全角)は、名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name ="aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters"
      end
      it 'お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name ="aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters"
      end
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @user.first_kana =""
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana can't be blank"
      end
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @user.last_kana =""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana can't be blank"
      end
      it 'お名前カナ(全角)は、名字が全角（カタカナ）でなければ登録できない' do
        @user.first_kana ="あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana is invalid. Input full-width katakana characters"
      end
      it 'お名前カナ(全角)は、名前が全角（カタカナ）でなければ登録できない' do
        @user.last_kana ="あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana is invalid. Input full-width katakana characters"
      end
      it '生年月日が空では登録できない' do
        @user.birth_date =""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end


