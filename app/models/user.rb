class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :nickname, presence: :true
  validates :sei, presence: true, format: { without: /[\uFF65-\uFF9F]/, message: "には半角カナを含めないでください" }
  validates :mei, presence: true, format: { without: /[\uFF65-\uFF9F]/, message: "には半角カナを含めないでください" }
  with_options presence: true, format: {with: /\A[ァ-ヶー]+\z/} do
    validates :sei_kana, presence: :true
    validates :mei_kana, presence: :true
  end
  validates :birthday, presence: :true
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

end
