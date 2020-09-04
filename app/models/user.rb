class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #空の投稿を保存しない
  with_options presence: true do
    validates :nickname
    validates :email
    validates :encrypted_password,   length: { minimum:6 }, format: { with: /\A[a-zA-Z0-9]+\z/, message:"は6文字以上の半角英数字で入力してください。" }
    validates :family_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message:"は全角で入力してください。" }
    validates :first_name,           format: { with: /\A[ぁ-んァ-ン一-龥]/, message:"は全角で入力してください。" }
    validates :family_name_reading,  format: { with: /\A[ァ-ヶー－]+\z/, message:"は全角カナで入力してください。" }
    validates :first_name_reading,   format: { with: /\A[ァ-ヶー－]+\z/, message:"は全角カナで入力してください。" }
    validates :date_of_birth,        numericality: { other_than:1 }
    #ジャンル選択時に「--」(つまりid:1)の時は保存を受け付けない
  end
end
