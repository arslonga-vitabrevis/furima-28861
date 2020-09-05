require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての値が正しく入力できていれば保存できること' do
    end
    it 'nicknameが空だと保存できないこと' do
    end
    it 'emailが空だと保存できないこと' do
    end
    it 'emailが一意性であること' do
    end
    it 'emailには@を含む必要があること' do
    end
    it 'passwordが空だと保存できないこと' do
    end
    it 'passwordは６文字以上であること' do
    end
    it 'passwordは半角英数字混合であること' do
    end
    it 'passwordは確認用も含めて2回入力すること' do
    end
    it 'family_nameが空だと保存できないこと' do
    end
    it 'first_nameが空だと保存できないこと' do
    end
    it 'family_name_readingが空だと保存できないこと' do
    end
    it 'first_name_readingが空だと保存できないこと' do
    end
    it 'family_name_readingは全角カタカナで入力すること' do
    end
    it 'first_name_readingは全角カタカナで入力すること' do
    end
    it 'date_of_birthが空だと保存できないこと' do
    end
  end
end
