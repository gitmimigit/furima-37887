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
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email =""
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email ="aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end
      it 'passwordが空では登録できない' do
        @user.password =""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password ="absd8"
        @user.password_confirmation =@user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      it 'passwordが英字のみのパスワードでは登録できない' do
        @user.password ="abcdef"
        @user.password_confirmation =@user.password
        @user.valid?        
        expect(@user.errors.full_messages).to include "パスワードは半角英数字で入力してください"
      end
      it 'passwordが数字のみのパスワードでは登録できない' do
        @user.password ="888888"
        @user.password_confirmation =@user.password
        @user.valid?        
        expect(@user.errors.full_messages).to include "パスワードは半角英数字で入力してください"
      end
      it 'passwordが全角文字を含むパスワードでは登録できない' do
        @user.password ="１２３ＡＢＣ"
        @user.password_confirmation =@user.password
        @user.valid?        
        expect(@user.errors.full_messages).to include "パスワードは半角英数字で入力してください"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password ="abcd08"
        @user.password_confirmation ="abcd09"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
    end
  end

  describe '新規登録本人情報確認' do
    context '新規登録できないとき' do
      it 'お名前(全角)は、名字が空では登録できない' do
        @user.first_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include "名字を入力してください"
      end
      it 'お名前(全角)は、名前が空では登録できない' do
        @user.last_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end
      it 'お名前(全角)は、名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name ="aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "名字は全角で入力してください"
      end
      it 'お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name ="aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "名前は全角で入力してください"
      end
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @user.first_kana =""
        @user.valid?
        expect(@user.errors.full_messages).to include "名字（カナ）を入力してください"
      end
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @user.last_kana =""
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（カナ）を入力してください"
      end
      it 'お名前カナ(全角)は、名字が全角（カタカナ）でなければ登録できない' do
        @user.first_kana ="あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "名字（カナ）は全角カナで入力してください"
      end
      it 'お名前カナ(全角)は、名前が全角（カタカナ）でなければ登録できない' do
        @user.last_kana ="あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（カナ）は全角カナで入力してください"
      end
      it '生年月日が空では登録できない' do
        @user.birth_date =""
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
    end
  end
end


