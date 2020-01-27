class JobInformation < ApplicationRecord
  # 求人票モデル

  belongs_to :user

  # Gem（refile）関連
  attachment :job_image


  # 求人要録に必要な項目
  enum genre: {有形営業: 1, 無形営業: 2, 商品サービス企画: 3, 物流倉庫管理: 4, 一般事務: 5, 人事: 6, 経理: 7, 総務: 8, システムエンジニア: 9, その他サービス: 10}
  enum area: {東京: 1, 神奈川: 2, 千葉: 3, 埼玉: 4}


  # バリデーション
  validates :company, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :summary, presence: true, length: { minimum: 10, maximum: 300 }
  validates :detail, presence: true, length: { minimum: 50, maximum: 1000 }


  # 通知機能関連
  has_many :notifications, dependent: :destroy


  # イイネ機能関連
  has_many :favorites, dependent: :destroy


  # すでに「いいね」されているか検索
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  # イイネされた際に通知モデルを保存
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and job_information_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        job_information_id: id,
        visited_id: user_id,
        action: 'like'
      )
      notification.save if notification.valid?
    end
  end

end
