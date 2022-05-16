require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる時' do
      it '必要な情報が揃っていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では出品できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it '商品の説明が空では出品できない' do
        @item.describe = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Describe can't be blank"
      end
      it 'カテゴリーの項目が未選択では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'カテゴリーの項目が"---"では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態の項目が未選択では出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '商品の状態の項目が"---"では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料負担の項目が未選択では出品できない' do
        @item.fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it '配送料負担の項目が"---"では出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it '発送元の地域の項目が未選択では出品できない' do
        @item.source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Source can't be blank"
      end
      it '発送元の地域の項目が"---"では出品できない' do
        @item.source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Source can't be blank"
      end
      it '発送までの日数の項目が未選択では出品できない' do
        @item.duration_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Duration can't be blank"
      end
      it '発送までの日数の項目が"---"では出品できない' do
        @item.duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Duration can't be blank"
      end
      it '価格が空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が¥300~¥9,999,999以下では出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it '価格が¥300~¥9,999,999以上では出品できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it '価格が半角数字でなければ出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid. Input half-width characters"
      end
      it 'ユーザーが紐付いてなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
