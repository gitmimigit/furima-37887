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
end
