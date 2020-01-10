class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # デバイス関連
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Gem関連
  attachment :profile_image


  # enum関連
  enum user_status: {一般ユーザー: 1, キャリアアドバイザー: 2}
  enum gender: {男性: 1, 女性: 2}
  enum career: {有形営業: 1, 無形営業: 2, 商品サービス企画: 3, 物流倉庫管理: 4, 一般事務: 5, 人事: 6, 経理: 7, 総務: 8, システムエンジニア: 9, 販売サービス: 10}
  enum expert: {メーカー系有形営業: 1, IT系無形営業: 2, マーケティング職: 3, 事務職: 4, 人事職: 5, 経理職: 6, 総務職: 7, エンジニア職: 8, 販売サービス職: 9}


  # アソシエーション
  has_many :job_informations, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy


  # フォロー機能関連
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end


end
