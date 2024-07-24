class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nick_name, presence: true 
validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
validates :password, presence: true, length: { minimum: 6 }, format: 
            { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/, message: "半角英数字を入力してください" }
validates :password_confirmation, presence: true, confirmation: { case_sensitive: true }
validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: "全角で入力してください" }
validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: "全角で入力してください" }
validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください" }
validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください" }
validates :birth_date, presence: true

end 

