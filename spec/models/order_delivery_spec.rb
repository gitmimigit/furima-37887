require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できる時' do
      it '必要な情報が揃っていれば購入できる' do
        expect(@order_delivery).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_delivery.address_line2 = ""
        expect(@order_delivery).to be_valid
      end
    end
    context '商品購入できない時' do
      it '郵便番号が空では購入できない' do
        @order_delivery.postal_code = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "郵便番号を入力してください"
      end
      it '郵便番号は、「3桁ハイフン4桁」でなければ購入できない' do
        @order_delivery.postal_code = "1111111"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "郵便番号は3桁-4桁で入力してください"
      end
      it '郵便番号は、半角文字列でなければ購入できない' do
        @order_delivery.postal_code = "１１１−１１１１"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "郵便番号は3桁-4桁で入力してください"
      end
      it '都道府県の項目が未選択では購入できない' do
        @order_delivery.source_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "都道府県を入力してください"
      end
      it '都道府県の項目が"---"では購入できない' do
        @order_delivery.source_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "都道府県を選択してください"
      end
      it '市区町村が空では購入できない' do
        @order_delivery.city = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "市区町村を入力してください"
      end
      it '番地が空では購入できない' do
        @order_delivery.address_line1 = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "番地を入力してください"
      end
      it '電話番号が空では購入できない' do
        @order_delivery.number = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "電話番号を入力してください"
      end
      it '電話番号が9桁以下では購入できない' do
        @order_delivery.number = "12345678"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "電話番号は10桁か11桁で入力してください"
      end
      it '電話番号が12桁以上では購入できない' do
        @order_delivery.number = "012345678910"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "電話番号は10桁か11桁で入力してください"
      end
      it '電話番号が半角数値でなければ購入できない' do
        @order_delivery.number = "１２３４５６７８９１０"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "電話番号は10桁か11桁で入力してください"
      end
      it "tokenが空では購入できない" do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "クレジットカード情報を入力してください"
      end
      it 'userが紐付いてなければ購入できない' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Userを入力してください"
      end
      it 'itemが紐付いてなければ購入できない' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Itemを入力してください"
      end
    end
  end
end
