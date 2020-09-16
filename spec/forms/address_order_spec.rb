require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '商品の注文' do
    before do 
      @item = FactoryBot.build_stubbed(:address_order)
    end

    context '商品の注文が上手くいく場合' do
      #examples
    end

    context '商品の注文が上手くいかない場合' do
      #examples
    end
  end
end