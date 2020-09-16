require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '商品の注文' do
    before do 
      @order = FactoryBot.build(:address_order)
    end

    context '商品の注文が上手くいく場合' do
      it '全ての値が正しく入力されていれば保存されること' do
        expect(@order).to be_valid
      end
      it 'トークンが生成されていること' do
        @order.token = "tok_5ca06b51685e001723a2c3b4aeb4"
        expect(@order).to be_valid
      end
      it '郵便番号がハイフン付きの7桁の数字であるなら保存されること' do
        @order.postal_code = "123-4567"
        expect(@order).to be_valid
      end
      it '都道府県が選択されていれば保存されること' do
        @order.prefecture_id = 13
        expect(@order).to be_valid
      end
      it '市町村が入力されていれば保存されること' do
        @order.city = "新宿区"
        expect(@order).to be_valid
      end
      it '番地が入力されていれば保存されること' do
        @order.house_number = "西新宿２丁目８−１"
        expect(@order).to be_valid
      end
      it '建物名が入力されていれば保存されること' do
        @order.building_name = "東京都本庁舎"
        expect(@order).to be_valid
      end
      it '電話番号がハイフンなしで11桁以内であるなら保存されること' do
        @order.telephone_number = "12345678901"
        expect(@order).to be_valid
      end
    end

    context '商品の注文が上手くいかない場合' do
      it 'トークンが生成できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が無ければ保存されないこと' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がハイフンなしなら保存されないこと' do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県の情報がなければ保存できないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市町村が入力されていなければ保存できないこと' do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていなければ保存できないこと' do
        @order.house_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が入力されていなければ保存できないこと' do
        @order.telephone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号がハイフン入りだと保存できないこと' do
        @order.telephone_number = "03-53211111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が12桁以上だと保存できないこと' do
        @order.telephone_number = "001111222233"
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end
    end
  end
end