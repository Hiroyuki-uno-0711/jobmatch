class JobInformation < ApplicationRecord

  belongs_to :user
  attachment :job_image
  enum genre: {有形営業: 1, 無形営業: 2, 商品サービス企画: 3, 物流倉庫管理: 4, 一般事務: 5, 人事: 6, 経理: 7, 総務: 8, システムエンジニア: 9, 販売サービス: 10}
  enum area: {東京: 1, 神奈川: 2, 千葉: 3, 埼玉: 4}

end
