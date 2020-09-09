require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品' do
    before do 
      @item = FactoryBot.build_stubbed(:item)
    end

    context '商品出品がうまくいく場合' do
      it '全ての値が正しく入力されていれば保存されること' do
        expect(@item).to be_valid
      end
      it '画像は1枚あれば保存できること' do
        image_path = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/cake.jpg'))
        @item.image = image_path
        expect(@item).to be_valid
      end
      it '商品名が入力されていれば保存できること' do
        @item.name = "雑誌"
        expect(@item).to be_valid
      end
      it '商品のコメントがあれば保存できること' do
        @item.text = "2020年9月号"
        expect(@item).to be_valid
      end
      it 'カテゴリーの情報が入力されていれば保存できること' do
        @item.item_category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態についての情報が入力されていれば保存できること' do
        @item.item_condition_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担についての情報が入力されていれば保存できること' do
        @item.shipping_charge_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域についての情報が入力されていれば保存できること' do
        @item.shipping_origin_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数についての情報が入力されていれば保存できること' do
        @item.shipping_period_id = 1
        expect(@item).to be_valid
      end
      it '価格の範囲が、¥300~¥9,999,999の間であれば保存できること' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない場合' do
      it '画像がなければ保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がなければ保存できないこと' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名が40文字を超えると保存できないこと' do
        @item.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it '商品の説明文がなければ保存できないこと' do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it '商品の説明文が1000文字を上回ると保存できないこと' do
        @item.text = "ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダミーテキスト。ダ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end
      it 'カテゴリーの情報がなければ保存できないこと' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it '商品の状態についての情報がなければ保存できないこと' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it '配送料の負担についての情報がなければ保存できないこと' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域についての情報がなければ保存できないこと' do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it '発送までの日数についての情報がなければ保存できないこと' do
        @item.shipping_period_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping period can't be blank")
      end
      it '価格についての情報がなければ保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300未満なら保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が¥10,000,000以上なら保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格は半角数字でないと保存できないこと' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
