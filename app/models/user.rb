class User < ApplicationRecord
  has_many :items
  has_one :order
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable #:validatable

  with_options presence: true do

    password_regexp = /\A[a-zA-Z0-9]+\z/
    name_regexp = /\A[ぁ-んァ-ン一-龥]/
    name_reading_regexp = /\A[ァ-ヶー－]+\z/

    validates :nickname
    validates :email,                format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "は@を含めて入力してください。"}, uniqueness: { case_sensitive: false }
    validates :password,             format: { with: password_regexp, message: "は半角英数字で入力してください。" }, length: { minimum:6 }
    validates :password_confirmation,format: { with: password_regexp, message: "は半角英数字で入力してください。" }, length: { minimum:6 }
    validates :family_name,          format: { with: name_regexp, message: "は全角で入力してください。" }
    validates :first_name,           format: { with: name_regexp, message: "は全角で入力してください。" }
    validates :family_name_reading,  format: { with: name_reading_regexp, message: "は全角カナで入力してください。" }
    validates :first_name_reading,   format: { with: name_reading_regexp, message: "は全角カナで入力してください。" }
    validates :date_of_birth
  end
end