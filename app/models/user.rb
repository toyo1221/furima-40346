class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze  # 半角英数字混在の正規表現
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/   # 全角（漢字・ひらがな・カタカナ）の正規表現
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/             # 全角カタカナの正規表現
  
  validates :nickname,        presence: true
  validates :first_name,      presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name,       presence: true, format: { with: VALID_NAME_REGEX }
  validates :kana_first_name, presence: true, format: { with: VALID_KANA_REGEX }
  validates :kana_last_name,  presence: true, format: { with: VALID_KANA_REGEX }
  validates :birthday,        presence: true
end