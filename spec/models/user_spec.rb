require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context "新規登録がうまく行くとき" do
      it "全ての値が正しく入力できていれば保存できること" do
        expect(@user).to be_valid
      end
      it "emailには@を含めば保存できること" do
        @user.email = "aaaa@aaaa"
        expect(@user).to be_valid
      end
      it "passwordは6文字以上の半角英数字混合であれば保存できること" do
        @user.password = "abc123"
        expect(@user).to be_valid
      end
      it "family_nameは全角文字であれば保存できること" do
        @user.family_name = "山田"
        expect(@user).to be_valid
      end
      it "first_nameは全角文字であれば保存ができること" do
        @user.first_name = "陸太郎"
        expect(@user).to be_valid
      end
      it "family_name_readingは全角カタカナであれば保存ができること" do
        @user.family_name_reading = "ヤマダ"
        expect(@user).to be_valid
      end
      it "first_name_readingは全角カタカナであれば保存ができること" do
        @user.family_name_reading = "リクタロウ"
        expect(@user).to be_valid
      end
    end 

    context "新規登録がうまくいかないとき" do
      it "nicknameが空だと保存できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "emailが空だと保存できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと保存できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationが空だと保存ができないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下であれば保存できないこと" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "family_nameが空だと保存できないこと" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが空だと保存できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_name_readingが空だと保存できないこと" do
        @user.family_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end
      it "first_name_readingが空だと保存できないこと" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end      
      it "date_of_birthが空だと保存できないこと" do
        @user.date_of_birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
