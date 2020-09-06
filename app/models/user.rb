class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #空の投稿を保存しない
  with_options presence: true do
    validates :nickname              #validationはフォームからやってきた情報のフィルタリングなので保存先のカラム名というよりフォーム名を記述
    validates :email,                uniqueness: { case_sensitive: false }
    validates :password,             format: { with: /\A[a-zA-Z0-9]+\z/, message:"は半角英数字で入力してください" }
    validates :family_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message:"は全角で入力してください。" }
    validates :first_name,           format: { with: /\A[ぁ-んァ-ン一-龥]/, message:"は全角で入力してください。" }
    validates :family_name_reading,  format: { with: /\A[ァ-ヶー－]+\z/, message:"は全角カナで入力してください。" }
    validates :first_name_reading,   format: { with: /\A[ァ-ヶー－]+\z/, message:"は全角カナで入力してください。" }
    validates :date_of_birth
  end
end
